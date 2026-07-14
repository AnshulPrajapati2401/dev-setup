#!/usr/bin/env bash
# ==============================================================================
# Plugins Engine Orchestration Engine
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$PLUGINS_DIR"

# Plugin Catalog Data Matrix
declare -A PLUGINS=(
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    ["zsh-completions"]="https://github.com/zsh-users/zsh-completions"
    ["fzf-tab"]="https://github.com/Aloxaf/fzf-tab"
)

for plugin in "${!PLUGINS[@]}"; do
    TARGET_PATH="$PLUGINS_DIR/$plugin"
    if [ ! -d "$TARGET_PATH" ]; then
        log_info "Downloading contextual enhancement wrapper module: $plugin..."
        git clone --depth=1 "${PLUGINS[$plugin]}" "$TARGET_PATH"
        log_success "Module configuration attached: $plugin."
    else
        log_success "Enhancement plugin verified: $plugin."
    fi
done
