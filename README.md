# Developer Workspace Bootstrap Environment Suite

Production-grade, clean workstation environment automation suite designed exclusively for **Debian 13 (Trixie)** setups running XFCE desktop wrapper structures. 

It provides an isolated system where **Ghostty** launches a beautiful, fast **Zsh (Powerlevel10k)** engine, while preserving **Bash** cleanly as the default global shell.

## Deep Integration Technical Features
* **Zero System Intrusion:** Avoids standard security hazards; completely refrains from `chsh` commands or arbitrary global path modifications.
* **100% Idempotent Design:** Run the tool configuration multiple times safely without duplicated alias maps or system corruption errors.
* **Automated Data Defense:** Generates local backup files (`*.bak`) automatically before editing any infrastructure profiles.

## Installation Execution
Clone this repository workspace down into local staging vectors, then pass standard authorization handles:
```bash
chmod +x setup.sh
./setup.sh
