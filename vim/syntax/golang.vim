" Vim indent file
" Language:	Go
" Author:	Alecs King <alecsk@gmail.com>
" Only load this indent file when no other was loaded.
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
