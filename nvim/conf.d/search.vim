" Search
nnoremap / /\v

" Clear last search highlights
nmap <leader>, :noh<CR>

" FZF & Ripgrep
nnoremap <silent> <C-f> :Rg<CR>

let g:fzf_layout = { 'window': 'enew' }
let g:fzf_preview_window = ['down:40%', 'ctrl-/']
