alias reload!='. ~/.zshrc'
alias vi='nvim -c ":NERDTree"'
alias vim='nvim -c ":NERDTree"'
alias neovim-wo-nerdtree='nvim'
alias cat="bat"
alias ls="ls -GwF"
alias my-ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias aetion="source ~/.dotfiles/zsh/profiles/aetion"
alias decent="source ~/.dotfiles/zsh/profiles/decent"
alias oneof="source ~/.dotfiles/zsh/profiles/oneof"
alias zsh_perf="/usr/bin/time $SHELL -i -c exit"
alias kgetimages="kubectl get pods -o jsonpath="{..image}" | tr -s '[[:space:]]' '\\n' | sort | uniq -c"
