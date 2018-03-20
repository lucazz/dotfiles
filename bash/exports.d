#!/bin/bash
export PATH="$PATH:/usr/local/bin/"
export AUTO_MOUNT_HOME=false
export GOPATH="/Users/Lucas/Projects/Golang"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export PATH="/usr/local/sbin:$PATH"
export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"

if ls --color &> /dev/null; then
	export colorflag="--color" # GNU syntax
	export LS_COLORS="di=1;36:ln=1;32:so=37:pi=1;31;40:ex=35:bd=37:cd=37:su=37:sg=37:tw=32:ow=32"
else # BSD syntax
	export colorflag="-G"
	export CLICOLOR=1
	export LSCOLORS="GxCxhxBafxhxhxhxhxcxcx"
fi

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

