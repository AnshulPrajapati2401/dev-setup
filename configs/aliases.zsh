# ==============================================================================
# Shell Component Command Aliases
# ==============================================================================

# Advanced Modern Replacements for Core Commands
if command -v eza &> /dev/null; then
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lh --icons --group-directories-first'
    alias la='eza -lah --icons --group-directories-first'
    alias lt='eza --tree --level=2 --icons'
fi

if command -v bat &> /dev/null; then
    alias cat='bat --style=plain'
elif command -v batcat &> /dev/null; then
    alias cat='batcat --style=plain'
fi

if command -v ripgrep &> /dev/null; then
    alias grep='rg'
fi

if command -v nvim &> /dev/null; then
    alias vim='nvim'
    alias vi='nvim'
fi

if command -v btop &> /dev/null; then
    alias top='btop'
fi

# Practical Quality of Life Shortcodes
alias cls='clear'
alias update='sudo apt update && sudo apt upgrade -y'
alias weather='curl -s "https://wttr.in?m"'
alias ip='curl -s https://ifconfig.me && echo ""'
alias ports='ss -tulanp'

# Git Convenience wrappers
alias lg='lazygit'
alias gs='git status'
alias gd='git delta'
