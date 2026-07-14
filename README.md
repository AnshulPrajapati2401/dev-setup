# Dev Setup

Automated developer environment setup for Debian 13 (Trixie) with Ghostty, Zsh, Powerlevel10k, and modern CLI tools.

## Overview

One-command installation script that configures a complete development workspace with curated tools, shell customizations, and a beautiful terminal environment.

## What Gets Installed

**Core Packages**: git, curl, wget, build-essential, zsh, ghostty, tmux, neovim, unzip, tree, jq

**Modern CLI Tools**: eza, bat, ripgrep, fd-find, fzf, zoxide, btop, fastfetch, git-delta, lazygit

**Shell Framework**: Oh My Zsh, Powerlevel10k theme

**Zsh Plugins**: zsh-autosuggestions, zsh-syntax-highlighting, zsh-completions, fzf-tab, git, zoxide

**Fonts**: JetBrainsMono Nerd Font

## Requirements

- Debian 13 (Trixie)
- Internet connection
- User with sudo access

## Quick Start

```bash
git clone https://github.com/AnshulPrajapati2401/dev-setup.git
cd dev-setup
chmod +x setup.sh
./setup.sh
```

## What Happens

1. Validates internet and Debian 13 OS
2. Installs APT packages and Lazygit
3. Downloads and installs JetBrainsMono Nerd Font
4. Installs Oh My Zsh and Powerlevel10k theme
5. Installs Zsh plugins
6. Configures Ghostty terminal

## Features

- **Idempotent**: Safe to run multiple times
- **Automatic Backups**: Creates `.bak` files before modifying configs
- **Non-Invasive**: Bash remains system default shell
- **One-Command Setup**: Fully automated installation

## Configuration Files

Located in `configs/` directory:
- `.zshrc` - Main Zsh config with Powerlevel10k and plugin setup
- `aliases.zsh` - 13 command aliases with modern replacements
- `functions.zsh` - 7 utility functions (mkcd, extract, git_cleanup, find_proc, kill_port, bak, gen_pass)
- `ghostty/config` - Terminal theme, font, and behavior settings

## Uninstall

```bash
./uninstall.sh
```

Removes all user-space configurations and restores from backups if available. APT packages remain installed.

## Project Structure

```
dev-setup/
├── setup.sh
├── uninstall.sh
├── scripts/
│   ├── helpers.sh
│   ├── install_packages.sh
│   ├── install_fonts.sh
│   ├── configure_zsh.sh
│   ├── install_plugins.sh
│   └── configure_ghostty.sh
└── configs/
    ├── .zshrc
    ├── .p10k.zsh
    ├── aliases.zsh
    ├── functions.zsh
    └── ghostty/config
```



