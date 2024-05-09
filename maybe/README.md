# Maybe

An open-source system for your personal finance.

* URL: https://maybe.co/
* GitHub: https://github.com/maybe-finance/maybe/

## Setup

The following optional and _non-sensitive_ environment variables can be set:
* `SYNTH_API_KEY`: obtain one from synthfinance.com
* `SMTP_USERNAME`: the user name for your SMTP sending service
* `SMTP_PASSWORD`: the password for your SMTP sending service
* `SECRET_KEY_BASE`: the secret to encrypt credentials, run `openssl rand -hex 64` to generate it

If you have set `REQUIRE_INVITE_CODE=true`, you need to generate an invite code for every user.
*Inside* the container, run
```bash
bundle exec rake invites:create
```
