#!/usr/bin/env bash
# ==============================================================================
# Complete De-provisioner Script
# ==============================================================================
set -euo pipefail

COLOR_WARNING='\033[0;33m'
COLOR_RESET='\033[0m'

echo -e "${COLOR_WARNING}[WARNING] This script will wipe your user-space shell and environment settings customized by this project!${COLOR_RESET}"
read -p "Are you absolutely sure you want to continue? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "De-provisioning aborted."
    exit 0
fi

echo "Removing configuration files and custom links..."
rm -f "$HOME/.zshrc"
rm -f "$HOME/.p10k.zsh"
rm -f "$HOME/.aliases.zsh"
rm -f "$HOME/.functions.zsh"
rm -f "$HOME/.config/ghostty/config"

echo "Purging installed framework plugins and themes..."
rm -rf "$HOME/.oh-my-zsh"

# Restore original file states from matching backup snapshots if generated
for item in ".zshrc" ".p10k.zsh" ".aliases.zsh" ".functions.zsh"; do
    if [[ -f "$HOME/${item}.bak" ]]; then
        echo "Restoring previous environment state: $item"
        mv "$HOME/${item}.bak" "$HOME/${item}"
    fi
done

if [[ -f "$HOME/.config/ghostty/config.bak" ]]; then
    echo "Restoring Ghostty terminal backup..."
    mv "$HOME/.config/ghostty/config.bak" "$HOME/.config/ghostty/config"
fi

echo "Environment restored successfully. Note: Shared APT system packages have been left intact to ensure machine OS stability."
