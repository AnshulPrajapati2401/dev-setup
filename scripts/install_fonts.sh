#!/usr/bin/env bash
# ==============================================================================
# Typography Processing Platform System
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/helpers.sh"

FONT_DIR="$HOME/.local/share/fonts"
FONT_NAME="JetBrainsMono"

log_info "Checking target font typography arrays..."

if find "$FONT_DIR" -name "*JetBrainsMono*NerdFont*" grep -q .; then
    log_success "JetBrainsMono Nerd Font arrays matched. Skipping redundant installs."
else
    log_info "Downloading and establishing dynamic typographic interface profiles..."
    mkdir -p "$FONT_DIR"
    TEMP_DIR=$(mktemp -d)

    curl -fLo "$TEMP_DIR/$FONT_NAME.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FONT_NAME.zip"
    unzip -q "$TEMP_DIR/$FONT_NAME.zip" -d "$TEMP_DIR"

    find "$TEMP_DIR" -name "*.ttf" -exec cp {} "$FONT_DIR/" \;

    log_info "Rebuilding systems-wide font caching architecture indices..."
    fc-cache -f -v > /dev/null

    rm -rf "$TEMP_DIR"
    log_success "Typographic rendering structures deployed systematically."
fi
