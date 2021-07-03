let g:fzf_layout = { 'window': 'enew' }
nnoremap <silent> <C-P> :FZF<cr>
nnoremap <silent> <leader>a :Ag<cr>
augroup localfzf
  autocmd!
  autocmd FileType fzf :tnoremap <buffer> <C-J> <C-J>
  autocmd FileType fzf :tnoremap <buffer> <C-K> <C-K>
  autocmd VimEnter * command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \   : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)
augroup END
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
