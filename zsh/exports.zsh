export ZSH=$HOME/.dotfiles
export EDITOR="nvim"
export VISUAL="nvim"
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!{.git,node_modules,log,sorbet,rbi,vendor,vcr_cassettes}/*'"
export FZF_DEFAULT_OPTS="--inline-info --height 40% --layout=reverse --border"
export CLOUD_DRIVE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
export HOST=$(hostname)
export AUTO_MOUNT_HOME=false
export LC_ALL=en_US.UTF-8
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export TERM=xterm-256color
export MANPATH="/usr/local/man:$MANPATH"
export GOPATH="/Users/Lucas/Projects/Golang"
PATH="$GOPATH/bin:$PATH"
PATH="$CARGO_PATH/bin:$PATH"
PATH="$ZSH/bin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$PATH:/usr/local/opt/fzf/bin"
PATH="$PATH:$HOME/.dotfiles/bin"
export -U PATH
