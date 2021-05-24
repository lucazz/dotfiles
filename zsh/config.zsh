export PROMPT='%F{blue}%40<..<%1~ $(gitprompt)' \
	&& PROMPT+='%(?.%(!.%F{white}❯%F{yellow}❯%F{red}.%F{blue}❯%F{cyan}❯%F{green})❯.%F{red}❯❯❯)%f '
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt complete_aliases
bindkey '^R' history-incremental-search-backward
bindkey '^[[1;3D' backward-word #alt + <- (tmux)
bindkey '^[^[[D'	backward-word #alt + <-
bindkey '^[[1;3C' forward-word	#alt + -> (tmux)
bindkey '^[^[[C'	forward-word	#alt + ->
