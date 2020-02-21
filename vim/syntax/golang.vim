if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetGoIndent()
setlocal indentkeys+=0=),0=},0=case,0=default
setlocal autoindent

if exists("*GetGoIndent")
  finish
endif

function! GetGoIndent()
  let prevlnum = prevnonblank(v:lnum - 1)
  if prevlnum == 0
    return 0
  endif
  let ind = indent(prevlnum)
  let prevline = getline(prevlnum)
  let midx = match(prevline, '^\s*\%(case\>\|default\>\)')
  if midx == -1
    let midx = match(prevline, '[({]\s*$')
  endif
  if midx != -1
    let ind = ind + &shiftwidth
  endif
  let midx = match(getline(v:lnum), '^\s*\%(case\>\|default\>\|[)}]\)')
  if midx != -1
    let ind = ind - &shiftwidth
  endif
  return ind
endfunction

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_auto_sameids = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_auto_type_info = 1

au FileType go nmap <leader>t :GoTest -short<cr>
au FileType go nmap <leader>b :GoBuild<cr>
au FileType go nmap <leader>r :GoRun<cr>

autocmd FileType go setlocal
  \ autoindent
  \ noexpandtab
  \ tabstop=4
  \ shiftwidth=4
