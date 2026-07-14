# ==============================================================================
# Advanced Programmable Shell Utilities
# ==============================================================================

# Make and instantly enter operational folder structures
mkcd() {
    if [ -z "${1:-}" ]; then
        echo "Error: Target directory path parameter missing."
        return 1
    fi
    mkdir -p "$1" && cd "$1"
}

# Automated multi-format archive decompression matrix
extract() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' extension cannot be processed via standard decoders." ;;
        esac
    else
        echo "'$1' is not a valid file path target."
    fi
}

# Purges fully integrated merged working branches inside repositories
git_cleanup() {
    log_info "Pruning internal branch nodes already unified with master/main structures..."
    git checkout q main 2>/dev/null || git checkout master
    git branch --merged | grep -v -E '(\*|master|main|dev)' | xargs -r git branch -d
}

# Process Identifier scanning wrapper
find_proc() {
    if [ -z "${1:-}" ]; then
        echo "Supply identification query string parameters."
        return 1
    fi
    ps aux | grep -i "$1" | grep -v grep
}

# Instantly release socket address allocations
kill_port() {
    if [ -z "${1:-}" ]; then
        echo "Supply active numeric port assignment values."
        return 1
    fi
    local pid
    pid=$(lsof -t -i:"$1")
    if [ -n "$pid" ]; then
        echo "Terminating process framework $pid holding network port $1..."
        kill -9 "$pid"
    else
        echo "No application footprints captured utilizing port $1."
    fi
}

# Rapid inline backup operations
bak() {
    if [ -z "${1:-}" ]; then
        echo "Supply targeted item names to backup."
        return 1
    fi
    cp -RL "$1" "$1.$(date +%Y%m%d_%H%M%S).bak"
}

# Strong Random Passcode string generations
gen_pass() {
    local len="${1:-24}"
    tr -dc 'A-Za-z0-9!@#$%^&*()_+{}|:<>?=-' < /dev/urandom | head -c "$len"
    echo ""
}
