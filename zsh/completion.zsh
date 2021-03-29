zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending
if [[ ! -o interactive ]]; then
  return
fi
compctl -K _tat tat
_tat() { reply=(`tmux ls -F "#{session_name}"`) }
