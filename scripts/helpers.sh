#!/usr/bin/env bash
# ==============================================================================
# Helper functions, colors, and global validations
# ==============================================================================
set -euo pipefail

# Text Formatting Colors
export COLOR_INFO='\033[0;34m'    # Blue
export COLOR_SUCCESS='\033[0;32m' # Green
export COLOR_WARNING='\033[0;33m' # Yellow
export COLOR_ERROR='\033[0;31m'   # Red
export COLOR_RESET='\033[0m'     # Reset

# Logging Functions
log_info() {
    echo -e "${COLOR_INFO}[INFO]${COLOR_RESET} $1"
}

log_success() {
    echo -e "${COLOR_SUCCESS}[SUCCESS]${COLOR_RESET} $1"
}

log_warning() {
    echo -e "${COLOR_WARNING}[WARNING]${COLOR_RESET} $1"
}

log_error() {
    echo -e "${COLOR_ERROR}[ERROR]${COLOR_RESET} $1" >&2
}

# Environment Verifications
check_internet() {
    log_info "Checking internet connectivity..."
    if ! wget -q --spider google.com; then
        log_error "No internet connection detected. Please check your network."
        exit 1
    fi
    log_success "Internet connection verified."
}

check_debian_version() {
    log_info "Verifying OS environment..."
    if [ -f /etc/os-release ]; then
        source /etc/os-release
        if [[ "${ID:-}" != "debian" ]] || [[ "${VERSION_CODENAME:-}" != "trixie" && "${VERSION_ID:-}" != "13" ]]; then
            log_warning "This script was built for Debian 13 (Trixie). Detected: ${NAME:-Unknown} ${VERSION:-}"
            read -p "Do you want to proceed anyway? (y/N) " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                log_error "Installation aborted by user."
                exit 1
            fi
        else
            log_success "Debian 13 (Trixie) verified."
        fi
    else
        log_error "Cannot determine OS version. /etc/os-release missing."
        exit 1
    fi
}

# Safe File Backup
backup_exist() {
    local target_file="$1"
    if [[ -f "$target_file" || -d "$target_file" ]]; then
        if [[ ! -L "$target_file" ]]; then
            local backup_path="${target_file}.bak"
            log_info "Backing up existing asset: $target_file -> $backup_path"
            rm -rf "$backup_path"
            cp -R "$target_file" "$backup_path"
        fi
    fi
}

# Safe Symlinking
safe_symlink() {
    local source_file="$1"
    local target_file="$2"

    backup_exist "$target_file"

    # Remove existing symlinks or dangling links safely
    if [[ -L "$target_file" || -f "$target_file" ]]; then
        rm -rf "$target_file"
    fi

    mkdir -p "$(dirname "$target_file")"
    ln -s "$source_file" "$target_file"
    log_success "Linked: $target_file -> $source_file"
}
