#!/usr/bin/env bash
# ==============================================================================
# Terminal Sub-Architect Linking Manager
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/helpers.sh"

GHOSTTY_TARGET_DIR="$HOME/.config/ghostty"
mkdir -p "$GHOSTTY_TARGET_DIR"

log_info "Linking hardware terminal configuration models..."
safe_symlink "$BASE_DIR/configs/ghostty/config" "$GHOSTTY_TARGET_DIR/config"
