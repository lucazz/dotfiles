if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
syntax clear

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent sw=4 et
setlocal indentkeys=o,O,*<Return>,!^F
