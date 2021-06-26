" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
scriptencoding utf-8
set encoding=utf-8

" Remove unused languages from polyglot
so ~/.config/nvim/plugin-configs/polyglot.vim

" Keymaps
so ~/.config/nvim/keymap.vim
nnoremap <C-tab> :tabnext<CR>

" Vundle Initialization
so ~/.config/nvim/plugs.vim

" General Config
set backspace=indent,eol,start
set history=100
set showcmd
set ignorecase
set autoread
set mouse=a
let mapleader=","

" Appearance
set background=dark
syntax on
syntax enable
set hlsearch
colorscheme dracula
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
set listchars=trail:·,tab:┊\ ,eol:¬
set lcs+=space:·
let $nvim_tui_enable_true_color=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Dracula theme configs
let g:dracula_italic = 1
let g:dracula_bold = 1
highlight Normal ctermbg=None
highlight SpecialKey ctermfg=60 guifg=#B6B6C8
highlight Whitespace ctermfg=60 guifg=#B6B6C8

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

" NERDTree
autocmd VimEnter * NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.DS_Store']
let NERDTreeShowHidden = 1
let NERDTreeMapOpenVSplit='v'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:netrw_dirhistmax=0

 " FZF mapping
let g:fzf_layout = { 'window': 'enew' }
nnoremap <silent> <C-P> :FZF<cr>
nnoremap <silent> <leader>a :Ag<cr>
augroup localfzf
  autocmd!
  autocmd FileType fzf :tnoremap <buffer> <C-J> <C-J>
  autocmd FileType fzf :tnoremap <buffer> <C-K> <C-K>
  autocmd VimEnter * command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \   : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
augroup END
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Makefile configs
autocmd FileType make set noexpandtab

" Bash configs
autocmd FileType sh setlocal autoindent

" Lightline
so ~/.config/nvim/plugin-configs/lightline.vim

" ViM Terraform
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_remap_spacebar=1
let g:terraform_commentstring='#%s'
let g:terraform_fmt_on_save=1

" Ale
so ~/.config/nvim/plugin-configs/ale.vim

" ======== YAML Settings
au BufNewFile,BufRead *.yaml,*.yml so ~/.config/nvim/syntax/yaml.vim

" ======== Golang Settings
let g:go_fmt_command = "goimports"
