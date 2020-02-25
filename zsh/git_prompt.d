#Git integration
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+="%F{yellow}|"
    fi
}

zstyle ":vcs_info:git:*" formats "%F{green}(%b) %a" */
zstyle ":vcs_info:git:*" formats "%F{green}(%b)%m%u%c"
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*:*' unstagedstr " %F{red}|"
zstyle ':vcs_info:git*:*' stagedstr " %F{blue}|"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
