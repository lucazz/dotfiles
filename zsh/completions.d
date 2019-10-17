# SZH Completions
autoload -U +X bashcompinit && bashcompinit
autoload -U compinit
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
compinit
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
[ -f /usr/local/etc/bash_completion.d ] \
  && . /usr/local/etc/bash_completion.d
[ -f ~/.dotfiles/zsh/completions/jx ] \
  && source ~/.dotfiles/zsh/completions/jx
[ -f /usr/local/etc/bash_completion ] \
  && source /usr/local/etc/bash_completion
[ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ] \
  && source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
[ -f ~/.fzf.zsh ] \
  && source ~/.fzf.zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
complete -o nospace -C /usr/local/bin/terraform terraform
