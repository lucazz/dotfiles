" ----------
" Leader key
" ----------
let mapleader = ","

imap jk <ESC>
nnoremap ; :

" Search
nnoremap / /\v
vnoremap / /\v

" Saving and buffer stuff
nmap <leader>q :q!<CR>
nmap <leader>w :w!<CR>

" Backing out of <paste> mode
nmap <leader>p :set nopaste<CR>

" Clear last search highlights
nmap <leader>, :noh<CR>

" Switch between / delete buffers
noremap <M-tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :BD<CR>
nmap <leader>D :bufdo bd<CR>

" NERDtree
nmap <silent> <leader>m :NERDTreeToggle<cr>%

" ==============================
" Window/Tab/Split Manipulation
" ==============================
nnoremap <C-DOWN> <C-W><C-J>
nnoremap <C-UP> <C-W><C-K>
nnoremap <C-RIGHT> <C-W><C-L>
nnoremap <C-LEFT> <C-W><C-H>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>"<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`]]))

" Fix commom typos
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap JJ <Esc>o

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>

nmap <Leader>f :Files<CR>
nmap <Leader>F :Files<CR>
map <Leader>c :TComment<CR>
map <Leader>C :TComment<CR>

" Golang mappings
map <Leader>gb :GoBuild<CR>
map <Leader>gr :GoRun<CR>
