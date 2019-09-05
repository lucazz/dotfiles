call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/bufkill.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'b4b4r07/vim-ansible-vault'
Plug 'w0rp/ale'
Plug 'hashivim/vim-terraform'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()
