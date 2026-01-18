#! /usr/bin/env bash
set -euo pipefail

DRY_RUN=0
ROOT="."
NC_USER="${NC_USER:-}"
EXCLUDE_DIRS=("__groupfolders" "appdata_*" "files_external" "gpxpod")

[[ ! -d "$ROOT" ]] && { echo "ERROR: $ROOT not found" >&2; exit 1; }

cd "$ROOT"

echo "Scanning root: $(pwd)"
echo "Excluding: ${EXCLUDE_DIRS[*]}"
[[ -n "$NC_USER" ]] && echo "Processing only user: $NC_USER"
[[ "$DRY_RUN" -eq 1 ]] && echo "DRY RUN MODE - no changes will be made"
echo

sanitize_name() {
  local s="$1"
  s="${s//[?<>:*|\"#%$'\n'$'\r']}"
  s="${s//$'\0'}"
  printf '%s' "$s"
}

is_excluded() {
  local dir="$1"
  for excl in "${EXCLUDE_DIRS[@]}"; do
    [[ "$dir" == $excl ]] && return 0
  done
  return 1
}

process_user() {
  local user="$1"
  local user_files="$user/files"

  [[ ! -d "$user_files" ]] && { echo "Skipping $user (no files/ directory)"; return; }

  echo "Processing user: $user"

  local offenders=()
  mapfile -d '' offenders < <(
    find "$user_files" -depth \
      \( -name '*[?<>:*|"#%]*' -o -name $'*\n*' -o -name $'*\r*' \) \
      -print0 2>/dev/null
  )

  if [[ ${#offenders[@]} -eq 0 ]]; then
    echo "  No offending items found."
    return
  fi

  echo "  Found ${#offenders[@]} item(s) with forbidden characters."

  for p in "${offenders[@]}"; do
    local dir base new dest
    dir="$(dirname "$p")"
    base="$(basename "$p")"
    new="$(sanitize_name "$base")"

    [[ "$new" == "$base" ]] && continue
    [[ -z "$new" ]] && new="unnamed"

    dest="${dir}/${new}"
    local n=1
    while [[ -e "$dest" ]]; do
      dest="${dir}/${new}_${n}"
      n=$((n+1))
    done

    [[ "$DRY_RUN" -eq 0 ]] && mv "$p" "$dest"
    echo "    $p -> $(basename "$dest")"
  done

  echo
}

if [[ -n "$NC_USER" ]]; then
  [[ ! -d "$NC_USER" ]] && { echo "ERROR: User directory '$NC_USER' not found" >&2; exit 1; }
  process_user "$NC_USER"
else
  for dir in */; do
    dir="${dir%/}"
    is_excluded "$dir" && continue
    [[ ! -d "$dir" ]] && continue
    process_user "$dir"
  done
fi

echo "Done. Run 'occ files:scan ${NC_USER:---all}' to refresh Nextcloud's filecache."
[[ "$DRY_RUN" -eq 1 ]] && echo "To apply changes, set DRY_RUN=0 in script."
