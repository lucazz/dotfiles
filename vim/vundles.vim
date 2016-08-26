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

" =============================================
" let Vundle manage Vundle (required)
" =============================================
Bundle "gmarik/vundle"

" =============================================
" Appearance
" =============================================
Bundle "bling/vim-airline"

" =============================================
" Project
" =============================================
Bundle "jistr/vim-nerdtree-tabs.git"
Bundle "scrooloose/nerdtree.git"

" =============================================
" Vim Improvements
" =============================================
Bundle "vim-scripts/bufkill.vim"
Bundle 'git://github.com/nathanaelkane/vim-command-w.git'
Bundle "Raimondi/delimitMate"
Bundle "briandoll/change-inside-surroundings.vim.git"
Bundle "terryma/vim-multiple-cursors"
Bundle "tpope/vim-surround.git"

" ============================================
" Search
" ===========================================
Bundle "rking/ag.vim"

"Filetype plugin indent on is required by vundle
filetype plugin indent on
