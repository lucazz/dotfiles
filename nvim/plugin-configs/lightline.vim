let g:lightline#bufferline#number_map = {
  \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
  \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'
\}
let g:lightline                    = {}
let g:lightline.colorscheme        = 'darcula'
let g:lightline.tabline            = {'left': [['buffers']]}
let g:lightline.component_expand   = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type     = {'buffers': 'tabsel'}
let g:lightline.component_raw      = {'buffers': 1}
let g:lightline.component_function = { 'lineinfo': 'LightlineLineinfo' }
let g:lightline#bufferline#enable_devicons  = 1
let g:lightline#bufferline#enable_nerdfont  = 1
let g:lightline#bufferline#unicode_symbols  = 1
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#clickable        = 1
let g:lightline#bufferline#min_tab_count    = 2
let g:lightline#bufferline#show_number      = 1
let g:lightline#bufferline#shorten_path     = 0
let g:lightline#bufferline#unnamed          = '[No Name]'
function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif
    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction
