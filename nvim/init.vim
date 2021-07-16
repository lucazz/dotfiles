" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8
scriptencoding utf-8


" General Config
au FocusGained,BufEnter * :silent! !
set backspace=indent,eol,start
set history=100
set showcmd
set ignorecase
set mouse=a
set autoread

let mapleader=","
let g:go_fmt_command = "goimports"              " Golang Settings
au FileType make set noexpandtab                " Makefile configs
au FileType sh setlocal autoindent              " Bash configs
so ~/.config/nvim/conf.d/polyglot.vim           " polyglot configs
so ~/.config/nvim/plugs.vim                     " Vundle Initialization
so ~/.config/nvim/conf.d/ale.vim                " ale configs
so ~/.config/nvim/conf.d/appearance.vim         " appearance configs
so ~/.config/nvim/conf.d/dracula.vim            " dracula theme configs
so ~/.config/nvim/conf.d/completions.vim        " completions configs
so ~/.config/nvim/conf.d/indent-guides.vim      " indent-guides configs
so ~/.config/nvim/conf.d/json.vim               " json configs
so ~/.config/nvim/conf.d/lightline.vim          " lightline configs
so ~/.config/nvim/conf.d/navigation.vim         " navigation configs
so ~/.config/nvim/conf.d/nerdtree.vim           " nerdtree configs
so ~/.config/nvim/conf.d/noswap.vim             " Turn Off Swap Files
so ~/.config/nvim/conf.d/persistent-undo.vim    " persistent undo configs
so ~/.config/nvim/conf.d/search.vim             " search configs
so ~/.config/nvim/conf.d/terraform.vim          " vim-terraform configs
so ~/.config/nvim/conf.d/terminal.vim           " terminal emulation configs
so ~/.config/nvim/conf.d/yaml.vim               " yaml configs
so ~/.config/nvim/conf.d/ysiw.vim               " yaml configs
