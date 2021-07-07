set expandtab
set nowrap
set linebreak
set shiftwidth=2
set softtabstop=2
set tabstop=2
filetype on
filetype plugin on
filetype indent on
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=236
set listchars=trail:·,tab:┊\ ,eol:¬
