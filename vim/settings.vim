" ========= Appearance ================
set t_Co=256
set cursorline
set mouse=a
set clipboard=unnamed

" NEOVIM
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:deoplete#enable_at_startup = 1
colorscheme dracula

" ========= NERDTree =================
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden = 1

" ========= Vim Airline ===============
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" ======== Folding ====================
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" ========= Trailing ==================
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace"

" ======= EasyMotion ================
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

let NERDTreeMapOpenVSplit='v'

set shell=/bin/bash

nnoremap <C-tab> :tabnext<CR>
