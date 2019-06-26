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
setlocal indentexpr=GetYamlIndent()
setlocal indentkeys=o,O,*<Return>,!^F

function! GetYamlIndent()
	let lnum = v:lnum - 1
	if lnum == 0
		return 0
	endif
	let line = substitute(getline(lnum),'\s\+$','','')
	let indent = indent(lnum)
	let increase = indent + &sw
	if line =~ ':$'
		return increase
	else
		return indent
	endif
endfunction


syn region yamlString	start="'" end="'" skip="\\'"
syn region yamlString	start='"' end='"' skip='\\"' contains=yamlEscape
syn region yamlComment	start="\#" end="$"

syn match yamlIndicator	"#YAML:\S\+"
syn match yamlDelimiter	"[:,-]"
syn match yamlBlock "[\[\]\{\}\|\>]"
syn match yamlOperator "[?^+-]\|=>"
syn match  yamlEscape	+\\[abfnrtv'"\\]+ contained
syn match  yamlEscape	"\\\o\o\=\o\=" contained
syn match  yamlEscape	"\\x\x\+" contained
syn match  yamlKey	"\w\+\ze\s*:"
syn match  yamlAnchor	"&\S\+"
syn match  yamlAlias	"*\S\+"
syn match  yamlType	"!\S\+"

syn keyword yamlConstant NULL Null null NONE None none NIL Nil nil
syn keyword yamlConstant TRUE True true YES Yes yes ON On on
syn keyword yamlConstant FALSE False false NO No no OFF Off off


hi link yamlConstant Keyword
hi link yamlIndicator PreCondit
hi link yamlAnchor	Function
hi link yamlAlias	Function
hi link yamlKey		Identifier
hi link yamlType	Type
hi link yamlComment	Comment
hi link yamlBlock	Operator
hi link yamlOperator	Operator
hi link yamlDelimiter	Delimiter
hi link yamlString	String
hi link yamlEscape	Special
