call plug#begin('~/.vim/plugged')
" On-demand loading
" ======== Interface ==========
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ======== Project ===========
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'

" ======= Vim improvments ===
Plug 'vim-scripts/bufkill.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'

" ====== Languages ==========
" Add plugins to &runtimepath
call plug#end()
