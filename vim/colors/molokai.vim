hi clear
if version > 580
	hi clear
	if exists("syntax_on")
		syntax	reset
	endif
endif
let g:colors_name="molokai"
if exists("g:molokai_original")
	let s:molokai_original = g:molokai_original
else
	let s:molokai_original = 0
endif
hi Boolean			guifg=#AE81FF
hi Character		guifg=#E6DB74
hi Number			guifg=#AE81FF
hi String			guifg=#E6DB74
hi Conditional		guifg=#F92672	gui=bold
hi Constant			guifg=#AE81FF	gui=bold
hi Cursor			guifg=#000000	guibg=#F8F8F0
hi iCursor			guifg=#000000	guibg=#F8F8F0
hi Debug			guifg=#BCA3A3	gui=bold
hi Define			guifg=#66D9EF
hi Delimiter		guifg=#8F8F8F
hi DiffAdd			guibg=#13354A
hi DiffChange		guifg=#89807D	guibg=#171717
hi DiffDelete		guifg=#960050	guibg=#171717
hi DiffText			guibg=#4C4745	gui=italic,bold
hi Directory		guifg=#A6E22E	gui=bold
hi Error			guifg=#E6DB74	guibg=#171717
hi ErrorMsg			guifg=#F92672	guibg=#171717	gui=bold
hi Exception		guifg=#A6E22E	gui=bold
hi Float			guifg=#AE81FF
hi FoldColumn		guifg=#465457	guibg=#171717
hi Folded			guifg=#465457	guibg=#171717
hi Function			guifg=#A6E22E
hi Identifier		guifg=#FD971F
hi Ignore			guifg=#808080	guibg=bg
hi IncSearch		guifg=#C4BE89	guibg=#171717
hi Keyword			guifg=#F92672	gui=bold
hi Label			guifg=#E6DB74	gui=none
hi Macro			guifg=#C4BE89	gui=italic
hi SpecialKey		guifg=#66D9EF	gui=italic
hi MatchParen		guifg=#000000	guibg=#171717	gui=bold
hi ModeMsg			guifg=#E6DB74
hi MoreMsg			guifg=#E6DB74
hi Operator			guifg=#F92672
hi Pmenu			guifg=#66D9EF	guibg=#171717
hi PmenuSel			guibg=#808080
hi PmenuSbar		guibg=#080808
hi PmenuThumb		guifg=#66D9EF
hi PreCondit		guifg=#A6E22E	gui=bold
hi PreProc			guifg=#A6E22E
hi Question			guifg=#66D9EF
hi Repeat			guifg=#F92672	gui=bold
hi Search			guifg=#000000	guibg=#171717
hi SignColumn		guifg=#A6E22E	guibg=#171717
hi SpecialChar		guifg=#F92672	gui=bold
hi SpecialComment	guifg=#7E8E91	gui=bold
hi Special			guifg=#66D9EF	guibg=bg		gui=italic
if	has("spell")
	hi SpellBad		guisp=#FF0000	gui=undercurl
	hi SpellCap		guisp=#7070F0	gui=undercurl
	hi SpellLocal	guisp=#70F0F0	gui=undercurl
	hi SpellRare	guisp=#FFFFFF	gui=undercurl
endif
hi Statement		guifg=#F92672	gui=bold
hi StatusLine		guifg=#455354	guibg=fg
hi StatusLineNC		guifg=#808080	guibg=#171717
hi StorageClass		guifg=#FD971F	gui=italic
hi Structure		guifg=#66D9EF
hi Tag				guifg=#F92672	gui=italic
hi Title			guifg=#ef5939
hi Todo				guifg=#FFFFFF	guibg=bg		gui=bold
hi Typedef			guifg=#66D9EF
hi Type				guifg=#66D9EF	gui=none
hi Underlined		guifg=#808080	gui=underline
hi VertSplit		guifg=#1B1D1E	guibg=#171717	gui=none
hi VisualNOS		guibg=#403D3D
hi Visual			guibg=#403D3D
hi WarningMsg		guifg=#FFFFFF	guibg=#171717	gui=bold
hi WildMenu			guifg=#66D9EF	guibg=#171717
hi TabLineFill		guifg=#1B1D1E	guibg=#171717
hi TabLine			guibg=#1B1D1E	guifg=#171717	gui=none
if	s:molokai_original	==	1
	hi Normal		guifg=#F8F8F2	guibg=#171717
	hi Comment		guifg=#75715E
	hi CursorLine	guibg=#3E3D32
	hi CursorLineNr	guifg=#FD971F	gui=none
	hi CursorColumn	guibg=#3E3D32
	hi ColorColumn	guibg=#3B3A32
	hi LineNr		guifg=#BCBCBC	guibg=#171717
	hi NonText		guifg=#75715E
	hi SpecialKey	guifg=#75715E
else
	hi Normal		guifg=#F8F8F2	guibg=#171717
	hi Comment		guifg=#7E8E91
	hi CursorLine	guibg=#293739
	hi CursorLineNr	guifg=#FD971F	gui=none
	hi CursorColumn	guibg=#293739
	hi ColorColumn	guibg=#232526
	hi LineNr		guifg=#465457	guibg=#171717
	hi NonText		guifg=#465457
	hi SpecialKey	guifg=#465457
end
