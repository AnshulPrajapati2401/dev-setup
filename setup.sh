#!/usr/bin/env bash
# ==============================================================================
# Main Orchestrator Execution Script
# ==============================================================================
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_DIR="$BASE_DIR/scripts"

# Load Shared Helpers
if [[ -f "$SCRIPT_DIR/helpers.sh" ]]; then
    source "$SCRIPT_DIR/helpers.sh"
else
    echo -e "\033[0;31m[ERROR]\033[0m Essential scripts/helpers.sh not found!"
    exit 1

fi

    log_info "===================================================="
    log_info " Starting Debian Workstation Bootstrap Customizer   "
    log_info "===================================================="

    # Preliminary Assertions
    check_internet
    check_debian_version

    # Execute Sub-Modules Sequentially
    log_info "Step 1: System Package Deployments..."
    bash "$SCRIPT_DIR/install_packages.sh"

    log_info "Step 2: Installing Custom Nerd Fonts..."
    bash "$SCRIPT_DIR/install_fonts.sh"

    log_info "Step 3: Building Shell Environments..."
    bash "$SCRIPT_DIR/configure_zsh.sh"

    log_info "Step 4: Compiling Visual Interfaces & Extensions..."
    bash "$SCRIPT_DIR/install_plugins.sh"

    log_info "Step 5: Wiring Native Terminal Emulators..."
    bash "$SCRIPT_DIR/configure_ghostty.sh"

    log_success "===================================================="
    log_success " Bootstrap System Completed Successfully!            "
    log_success " Please fire up Ghostty to experience your new rig.  "
    log_success "===================================================="
