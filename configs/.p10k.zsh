# ==============================================================================
# Tailored Powerlevel10k Minimal Prompts Engine Core Profiles
# ==============================================================================
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases' ]] || p10k_config_opts+=('aliases')
'builtin' 'setopt' 'no_aliases' 'extended_glob'

{
  # Explicit Custom Element Mappings
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir                     # Current active operations directory location pathing
    vcs                     # Structured Version Controls Tracking Infrastructure Matrixes
    prompt_char             # Operational action states characters marker
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # Return status tracking numerical codes
    command_execution_time  # Precise compute load timing matrices
    python                  # Active virtualization engines variables (Python)
    node_version            # System Node Runtime footprints tracker
  )

  # Visually Clean Prompt Typography Parameters
  typeset -g POWERLEVEL9K_MODE=nerdfont-v3
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate

  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # Prompt Segment Colorations & Layout Anchors
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=none
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=4
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=..

  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=none
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=2
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=none
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=3

  # Transient Prompt Core Activation Protocols
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # Timing Threshold Constraints Configuration
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=none
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=5

} (( ${#p10k_config_opts} )) && 'builtin' 'setopt' "${p10k_config_opts[@]}"
'builtin' 'unset' 'p10k_config_opts'
