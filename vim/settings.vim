" ========= Appearance ================
if !has("gui_running")
   let g:gruvbox_italic=0
endif

set background=dark
colorscheme monokai
set cursorline
set mouse=a
set clipboard=unnamed

if has("gui_running")
    set guioptions-=T " no toolbar
    set guioptions-=m " no menus
    set guioptions-=r " no scrollbar on the right
    set guioptions-=R " no scrollbar on the right
    set guioptions-=l " no scrollbar on the left
    set guioptions-=b " no scrollbar on the bottom
    set guioptions-=L

    if has("gui_gtk2")
      set guifont=Roboto\ for\ Powerline:h12
    else
      set guifont=Roboto\ for\ Powerline:h12
    endif
endif

" ========= NERDTree =================
let NERDTreeIgnore = ['\.pyc$']

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
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace"

" ======= Syntastic ==================
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
" we want to tell the syntastic module when to run
" we want to see code highlighting and checks when  we open a file
" but we don't care so much that it reruns when we close the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:go_fmt_fail_silently = 1
" ======= EasyMotion ================
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" CTRL P
let g:ctrlp_custom_ignore = 'deps\|_build'

let NERDTreeMapOpenVSplit='v'

set shell=/bin/bash

nnoremap <C-tab> :tabnext<CR>
