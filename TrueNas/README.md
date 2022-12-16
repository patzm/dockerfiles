# TrueNas Scale configuration for docker 🐳

Files and scripts to configure docker 🐳 on TrueNas Scale.
Edit `enable-docker.sh`, follow the instructions in the comments.
Source of the script: [link](https://gist.github.com/tprelog/7988dc6b196775f33929beb19f0090d7) 🔗.
Place `enable-docker.sh` somewhere in a persisted dataset.
Add a init script in the TrueNas admin console: _System Settings_ `>` _Advanced_ `>` _Init/Shutdown Scripts_.
* Type: script
* When: `POSTINIT`
* Script: point to the absolute path of the script.
* Timeout: `20` (seconds) works well for me.
