call plug#begin('~/.vim/plugged')
" On-demand loading
" ======== Interface ==========
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

" ======== Project ===========
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" ======= Vim improvments ===
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/bufkill.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'b4b4r07/vim-hcl'
Plug 'fatih/vim-go'

" ====== Languages ==========
" Add plugins to &runtimepath
call plug#end()
