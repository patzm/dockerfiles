ARG HERMES_TAG=latest
FROM nousresearch/hermes-agent:${HERMES_TAG}

ARG BW_VERSION=2026.8.0
ARG TARGETARCH=amd64
ARG BW_SHA256_AMD64=367f618e9fcccaac4980ec12c7bafd01df739b5f3cb1af31bc9045cf75eea1d6
ARG BW_SHA256_ARM64=74d822a5dceda5896ed8fc07bc61925b29afd98d96a6a3e9e525ae556c3083a8
RUN set -eu; \
    case "$TARGETARCH" in \
        amd64) archive="bw-linux-${BW_VERSION}.zip"; sha256="$BW_SHA256_AMD64" ;; \
        arm64) archive="bw-linux-arm64-${BW_VERSION}.zip"; sha256="$BW_SHA256_ARM64" ;; \
        *) echo "Unsupported architecture: $TARGETARCH" >&2; exit 1 ;; \
    esac; \
    curl -fsSL --retry 3 \
        "https://github.com/bitwarden/clients/releases/download/cli-v${BW_VERSION}/${archive}" \
        -o /tmp/bw.zip; \
    printf '%s  %s\n' "$sha256" /tmp/bw.zip | sha256sum -c -; \
    python3 -m zipfile -e /tmp/bw.zip /tmp/bw; \
    install -m 0755 /tmp/bw/bw /usr/local/bin/bw; \
    rm -rf /tmp/bw /tmp/bw.zip

COPY --chmod=0755 entrypoint.sh vaultwarden-start.sh /usr/local/bin/
