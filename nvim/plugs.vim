call plug#begin('~/.config/nvim/plugged')
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdcommenter'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'vim-scripts/bufkill.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Raimondi/delimitMate'
  Plug 'scrooloose/syntastic'
  Plug 'airblade/vim-gitgutter'
  Plug 'dyng/ctrlsf.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-surround'
  Plug 'ervandew/supertab'
  Plug 'w0rp/ale'
  Plug 'hashivim/vim-terraform'
  Plug 'towolf/vim-helm'
  Plug 'sheerun/vim-polyglot'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'chr4/nginx.vim'
  Plug 'tpope/vim-repeat'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'nathanaelkane/vim-indent-guides'
call plug#end()
