" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8
scriptencoding utf-8

" Vundle Initialization
so ~/.config/nvim/plugs.vim

" General Config
set backspace=indent,eol,start
set history=100
set showcmd
set ignorecase
set mouse=a

" Mapping leader key
let mapleader=","

" Automatically reload files on change
set autoread
au FocusGained,BufEnter * :silent! !

" Key maps
nmap <leader>q :q!<CR>
nmap <leader>w :w!<CR>

" Appearance
set background=dark
set hlsearch
set incsearch
set smartcase
set noshowmode
set t_Co=256
set t_ut=
set t_vb=""
set visualbell
set cursorline
set colorcolumn=80
set clipboard=unnamed
set number
set hidden
set list
set listchars=eol:¬
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let $nvim_tui_enable_true_color=1
syntax on
syntax enable
colorscheme dracula

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Persistent Undo
if has('persistent_undo')
  silent !mkdir ~/.config/nvim/.backups > /dev/null 2>&1
  set undodir=~/.config/nvim/.backups
  set undofile
endif

" Indentation & tab settings
set expandtab
set nowrap
set linebreak
set shiftwidth=2
set softtabstop=2
set tabstop=2
filetype on
filetype plugin on
filetype indent on

" Completion
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/target/*
set wildignore+=*.class
set wildignore+=*.pyc

" Scrolling
set lazyredraw
set ttyfast
set scrolloff=27
set sidescrolloff=27
set sidescroll=1

" YAML Settings
au BufNewFile,BufRead *.yaml,*.yml so ~/.config/nvim/syntax/yaml.vim

" Golang Settings
let g:go_fmt_command = "goimports"

" Makefile configs
autocmd FileType make set noexpandtab

" Bash configs
autocmd FileType sh setlocal autoindent

" NERDTree
so ~/.config/nvim/plugin-configs/nerdtree.vim

" Indent Guides
so ~/.config/nvim/plugin-configs/vim-indent-guides.vim

" terminal emulation
so ~/.config/nvim/plugin-configs/terminal.vim

 " FZF mapping
so ~/.config/nvim/plugin-configs/fzf.vim

" Lightline
so ~/.config/nvim/plugin-configs/lightline.vim

" ViM Terraform
so ~/.config/nvim/plugin-configs/terraform.vim

" Ale
so ~/.config/nvim/plugin-configs/ale.vim

" Remove unused languages from polyglot
so ~/.config/nvim/plugin-configs/polyglot.vim

" Dracula theme configs
so ~/.config/nvim/plugin-configs/dracula.vim
