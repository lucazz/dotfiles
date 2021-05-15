zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' insert-tab pending
completion='$(brew --prefix)/share/zsh/site-functions/_git'
if test -f $completion
then
  source $completion
fi
if [[ ! -o interactive ]]; then
    return
fi
compctl -K _tat tat
_tat() { reply=(`tmux ls -F "#{session_name}"`) }

# gcloud-cli
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

command -v flux >/dev/null && . <(flux completion zsh) && compdef _flux flux
