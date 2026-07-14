# ==============================================================================
# Custom Execution Layer Shell Environment Entry Profile
# ==============================================================================

# Initialize Powerlevel10k Optimization Instant Engine Speed Hooks
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Define Framework Path Roots
export ZSH="$HOME/.oh-my-zsh"

# Visual Theme Configurations
ZSH_THEME="powerlevel10k/powerlevel10k"

# Modular Active Extensions Register
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    fzf-tab
    zoxide
)

# Core Shell Engine Initializations
source "$ZSH/oh-my-zsh.sh"

# Context Configuration Link Dependencies
[[ -f "$HOME/.aliases.zsh" ]] && source "$HOME/.aliases.zsh"
[[ -f "$HOME/.functions.zsh" ]] && source "$HOME/.functions.zsh"
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# Integrated Component Extensions Environment Inits
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
eval "$(zoxide init zsh)"

# Dynamic Visualization Blocks (Restricted to Ghostty Interactive Shells Only)
if [[ -o interactive ]] && [[ "${TERM:-}" == *"xterm-ghostty"* || -n "${GHOSTTY_BIN_DIR:-}" ]]; then
    fastfetch
fi

# Storage History Profiles
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt AUTO_CD
setopt CORRECT

# Advanced Completion Parameter Configurations
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
