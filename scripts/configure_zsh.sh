#!/usr/bin/env bash
# ==============================================================================
# Shell Core Architecture Provisioner
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/helpers.sh"

ZSH_CUSTOM_DIR="$HOME/.oh-my-zsh/custom"

# Install Oh My Zsh Framework cleanly, without swapping operational interactive handles
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log_info "Deploying Framework Engine: Oh My Zsh..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_success "Oh My Zsh integration complete."
else
    log_success "Oh My Zsh base verified."
fi

# Clone Powerlevel10k theme
P10K_THEME_DIR="$ZSH_CUSTOM_DIR/themes/powerlevel10k"
if [ ! -d "$P10K_THEME_DIR" ]; then
    log_info "Cloning graphical render skin: Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_THEME_DIR"
else
    log_success "Powerlevel10k visual theme present."
fi

# Setup Symbolic Links to configs/ tracking structures
safe_symlink "$BASE_DIR/configs/.zshrc" "$HOME/.zshrc"
safe_symlink "$BASE_DIR/configs/.p10k.zsh" "$HOME/.p10k.zsh"
safe_symlink "$BASE_DIR/configs/aliases.zsh" "$HOME/.aliases.zsh"
safe_symlink "$BASE_DIR/configs/functions.zsh" "$HOME/.functions.zsh"
