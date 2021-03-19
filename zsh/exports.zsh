export ZSH=$HOME/.dotfiles
export EDITOR="nvim"
export VISUAL="nvim"
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!{.git,node_modules,log,sorbet,rbi,vendor,vcr_cassettes}/*'"
export FZF_DEFAULT_OPTS="--inline-info --height 40% --layout=reverse"
export GPG_TTY=$(tty)
export HOST=$(hostname)
export AUTO_MOUNT_HOME=false
export LC_ALL=en_US.UTF-8
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export TERM=xterm-256color
export MANPATH="/usr/local/man:$MANPATH"
export GOPATH="/Users/Lucas/go"
PATH="$GOPATH/bin:$PATH"
PATH="$ZSH/bin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$PATH:/usr/local/opt/fzf/bin"
PATH="$PATH:$HOME/.dotfiles/bin"
PATH="$PATH:$HOME/.local/bin"
export -U PATH
