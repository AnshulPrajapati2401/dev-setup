#!/usr/bin/env bash
# ==============================================================================
# Managed Systems Dependency Processor
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

# Managed Package Manifest Array
PACKAGES=(
    "git"
    "curl"
    "wget"
    "build-essential"
    "zsh"
    "ghostty"
    "eza"
    "bat"
    "fzf"
    "zoxide"
    "ripgrep"
    "fd-find"
    "btop"
    "fastfetch"
    "tmux"
    "neovim"
    "unzip"
    "fonts-powerline"
    "tree"
    "jq"
    "git-delta"
)

log_info "Synchronizing advanced packaging tool database cascades..."
sudo apt-get update -y

MISSING_PACKAGES=()

for pkg in "${PACKAGES[@]}"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        MISSING_PACKAGES+=("$pkg")
    fi
done

# Idempotent Evaluation
if [ ${#MISSING_PACKAGES[@]} -eq 0 ]; then
    log_success "All core APT software layers are verified as present."
else
    log_info "Installing targeted applications: ${MISSING_PACKAGES[*]}"
    sudo apt-get install -y "${MISSING_PACKAGES[@]}"
fi

# Manual Installer Cascade for applications outside stable Apt structures
if ! command -v lazygit &> /dev/null; then
    log_info "Lazygit framework omitted from matching tree binaries. Executing targeted build distribution downlinks..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | jq -r .tag_name | sed 's/^v//')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar -xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin/
    rm -rf lazygit.tar.gz lazygit
    log_success "Lazygit engine successfully operationalized."
else
    log_success "Lazygit component engine present."
fi
