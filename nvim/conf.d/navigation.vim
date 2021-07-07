" Switch between / delete buffers
noremap <M-tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :BD<CR>
nmap <leader>D :BD<CR>

" Window/Tab/Split Manipulation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>

" Create window splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Folding
set foldmethod=indent
set nofoldenable
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Key maps
nmap <leader>q :q!<CR>
nmap <leader>w :w!<CR>
