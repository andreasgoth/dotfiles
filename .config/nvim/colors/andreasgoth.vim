" Something something

let g:colors_name = "andreasgoth"

set background=dark
hi clear

if exists("syntax_on")                                
  syntax reset
endif

hi pythonSpaceError ctermbg=red guibg=red

hi StatusLine ctermbg=darkgrey ctermfg=white
hi StatusLineNC ctermbg=black ctermfg=lightgrey
hi VertSplit ctermbg=black ctermfg=lightgrey

highlight DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
highlight DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
highlight DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

highlight PmenuSel ctermfg=16 ctermbg=156
highlight ColorColumn guibg=#111111
" ********************************************************************************

" General colors
hi Normal           guifg=#f6f3e8     guibg=#161616     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi NonText          guifg=#070707     guibg=black       gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE

hi Cursor           guifg=black       guibg=220         gui=NONE      ctermfg=black       ctermbg=220         cterm=NONE
hi CursorLine       guifg=NONE        guibg=#121212
hi CursorLineNR     guifg=#cccccc     guibg=#000000
hi CursorColumn     guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
hi LineNr           guifg=#3D3D3D     guibg=black       gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi VertSplit        guifg=#202020     guibg=#202020     gui=NONE      ctermfg=darkgray    ctermbg=darkgray    cterm=NONE
hi StatusLine       guifg=#ffffff     guibg=#000000     gui=italic    ctermfg=white       ctermbg=darkgray    cterm=NONE
hi StatusLineNC     guifg=#777777     guibg=#000000     gui=NONE      ctermfg=blue        ctermbg=darkgray    cterm=NONE  

hi Folded           guifg=#a0a8b0     guibg=#384048     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title            guifg=#f6f3e8     guibg=NONE        gui=bold      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual           guifg=#000000     guibg=#FFEB87     gui=NONE      ctermfg=NONE        ctermbg=236         cterm=NONE

hi SpecialKey       guifg=#808080     guibg=#343434     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi WildMenu         guifg=green       guibg=yellow      gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar        guifg=black       guibg=white       gui=NONE      ctermfg=black       ctermbg=white       cterm=NONE
"hi Ignore           guifg=gray        guibg=black       gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=16          ctermbg=red         cterm=NONE  guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16          ctermbg=red         cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16          ctermbg=red         cterm=NONE
hi SpellBad         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16          ctermbg=160         cterm=NONE

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=black       guibg=#56FFC4     gui=BOLD      ctermfg=black       ctermbg=cyan        cterm=BOLD

hi MatchParen     guifg=#f6f3e8     guibg=#857b6f     gui=BOLD      ctermfg=white       ctermbg=darkgray    cterm=NONE
hi Pmenu          guifg=#f6f3e8     guibg=#444444     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi PmenuSel       guifg=#000000     guibg=#cae682     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Search         guifg=#FFEB87     guibg=#444444     gui=underline ctermfg=NONE        ctermbg=NONE	      cterm=underline

" Syntax highlighting
hi Comment          guifg=#68847B
hi String           guifg=#B8C8C4
hi Number           guifg=#aaa1ca

hi Keyword          guifg=#AABDCA  guibg=NONE  gui=NONE  ctermfg=NONE  ctermbg=NONE cterm=NONE
hi PreProc          guifg=#9e9e9e
hi Conditional      guifg=#B0B0B0

hi Todo             guifg=#FF3627  guibg=#000000
hi Constant         guifg=#8787D7

hi Identifier       guifg=#ffffff
hi Function         guifg=#ffffff  guibg=NONE  gui=NONE  ctermfg=NONE  ctermbg=NONE cterm=NONE
hi Type             guifg=#AABDCA  guibg=NONE  gui=NONE  ctermfg=NONE  ctermbg=NONE cterm=NONE
hi Statement        guifg=#AABDCA  guibg=NONE  gui=NONE  ctermfg=NONE  ctermbg=NONE cterm=NONE

hi Special          guifg=#E18964
hi Delimiter        guifg=#00A0A0
hi Operator         guifg=#B0B0B0

hi link Character       Constant
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" Special for XML
hi link xmlTag          Keyword 
hi link xmlTagName      Conditional 
hi link xmlEndTag       Identifier 

" Special for HTML
hi link htmlTag         Keyword 
hi link htmlTagName     Conditional 
hi link htmlEndTag      Identifier 

" Special for Javascript
hi link javaScriptNumber      Number 

" Special for Python
hi  link pythonEscape         Keyword      

" Special for CSharp
hi  link csXmlTag             Keyword      

