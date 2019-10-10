#Git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
#zstyle ":vcs_info:git:*" formats "%F{green}(%b) %a"
zstyle ":vcs_info:git:*" formats "%F{green}(%b)%m%u%c"
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*:*' unstagedstr "%F{red}|U"
zstyle ':vcs_info:git*:*' stagedsrt "%F{blue}|S"
