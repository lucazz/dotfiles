" Leader key
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
nmap <leader>np :set nopaste<CR>

" Clear last search highlights
nmap <leader>, :noh<CR>

" Switch between / delete buffers
noremap <M-tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :BD<CR>
nmap <leader>D :bufdo bd<CR>

" Window/Tab/Split Manipulation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>

" Create window splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>"<ESC>

" ,) or ,( Surround a word with (parens)
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

nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath
vmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
