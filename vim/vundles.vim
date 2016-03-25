" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/ "Submodules
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle "gmarik/vundle"

" =============================================
" Appearance
" =============================================
Bundle "bling/vim-airline"
Bundle "morhetz/gruvbox"
Bundle "chriskempson/vim-tomorrow-theme"
Bundle "sickill/vim-monokai"

" =============================================
" Project
" =============================================
Bundle "jistr/vim-nerdtree-tabs.git"
Bundle "scrooloose/nerdtree.git"
Bundle "kien/ctrlp.vim"
Bundle "rizzatti/dash.vim"
Bundle 'vim-scripts/ctags.vim'
" =============================================
" Languages
" =============================================
Bundle "pangloss/vim-javascript"
Bundle "itspriddle/vim-jquery.git"
Bundle "scrooloose/syntastic.git"
Bundle "skwp/vim-html-escape"
Bundle "honza/vim-snippets"
Bundle "burnettk/vim-angular"
Bundle "elixir-lang/vim-elixir"

" =============================================
" Vim Improvements
" =============================================
Bundle "vim-scripts/bufkill.vim"
Bundle 'git://github.com/nathanaelkane/vim-command-w.git'
Bundle "Raimondi/delimitMate"
Bundle "tpope/vim-fugitive"
Bundle "briandoll/change-inside-surroundings.vim.git"
Bundle "tomtom/tcomment_vim.git"
Bundle "terryma/vim-multiple-cursors"
Bundle "tomtom/tlib_vim"
Bundle "MarcWeber/vim-addon-mw-utils.git"
Bundle "tpope/vim-surround.git"
Bundle "sickill/vim-pasta"
Bundle "SirVer/ultisnips"
Bundle "vim-scripts/YankRing.vim"
Bundle "Valloric/YouCompleteMe"
Bundle "ervandew/supertab"

" ============================================
" Search
" ===========================================
Bundle "Lokaltog/vim-easymotion"
Bundle "rking/ag.vim"

"Filetype plugin indent on is required by vundle
filetype plugin indent on
