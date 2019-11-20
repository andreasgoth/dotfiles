" andreasgoth color theme

let g:colors_name = "andreasgoth"

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

syntax keyword jsCommentTodo contained TODO FIXME XXX TBD INCOMPLETE DEBUG BUG NOTE REVIEW REFACTOR REMOVE HACK @todo

" General colors
hi Normal           guifg=#f6f3e8   guibg=NONE      gui=NONE
hi NonText          guifg=#070707   guibg=NONE      gui=NONE

hi Cursor           guifg=black     guibg=220       gui=NONE
hi CursorLine       guifg=NONE      guibg=#121212
hi CursorLineNR     guifg=#999999   guibg=#000000
hi CursorColumn     guifg=NONE      guibg=#121212   gui=NONE
hi ColorColumn                      guibg=#1a1a1a
hi LineNr           guifg=#444444   guibg=NONE      gui=NONE

hi VertSplit        guifg=#202020   guibg=#202020   gui=NONE
hi StatusLine       guifg=#ffffff   guibg=#000000   gui=italic
hi StatusLineNC     guifg=#000000   guibg=#333333   gui=NONE

hi Folded           guifg=#a0a8b0   guibg=#384048   gui=NONE
hi Title            guifg=#f6f3e8   guibg=NONE      gui=bold
hi Visual           guifg=#000000   guibg=#FFEB87   gui=NONE

hi SpecialKey       guifg=#808080   guibg=#343434   gui=NONE

hi Ignore           guifg=gray      guibg=black     gui=NONE      ctermfg=NONE       ctermbg=NONE        cterm=NONE
hi WildMenu         guifg=green     guibg=yellow    gui=NONE
hi PmenuSbar        guifg=black     guibg=white     gui=NONE

hi Error            guifg=NONE      guibg=NONE      gui=undercurl guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=#FF6C60   guibg=#000000   gui=BOLD
hi WarningMsg       guifg=white     guibg=#FF6C60   gui=BOLD
hi SpellBad         guifg=white     guibg=#FF6C60   gui=BOLD

" Message displayed in lower left, such as --INSERT--
hi ModeMsg          guifg=black     guibg=#ffffff   gui=BOLD

hi MatchParen       guifg=#f6f3e8   guibg=#857b6f   gui=BOLD      ctermfg=white      ctermbg=darkgray    cterm=NONE
hi Pmenu            guifg=#f6f3e8   guibg=#444444   gui=NONE      ctermfg=NONE       ctermbg=NONE        cterm=NONE
hi PmenuSel         guifg=#000000   guibg=#cae682   gui=NONE      ctermfg=NONE       ctermbg=NONE        cterm=NONE
hi Search           guifg=#FFEB87   guibg=#444444   gui=underline ctermfg=NONE       ctermbg=NONE        cterm=underline

" Syntax highlighting
hi Comment          guifg=#E5D8A1  gui=bold
hi String           guifg=#B8C8C4
hi Number           guifg=#aaa1ca

hi Keyword          guifg=#AABDCA  guibg=NONE  gui=NONE  ctermfg=NONE  ctermbg=NONE cterm=NONE
hi PreProc          guifg=#9e9e9e
hi Conditional      guifg=#B0B0B0

hi Todo             guifg=#FFE266  guibg=#322900 gui=BOLD
hi Constant         guifg=#8787D7

hi Identifier       guifg=#ffffff
hi Function         guifg=#ffffff  guibg=NONE  gui=NONE  ctermfg=NONE  ctermbg=NONE cterm=NONE
hi Type             guifg=#AABDCA  guibg=NONE  gui=NONE  ctermfg=NONE  ctermbg=NONE cterm=NONE
hi Statement        guifg=#AABDCA  guibg=NONE  gui=NONE  ctermfg=NONE  ctermbg=NONE cterm=NONE

hi Special          guifg=#E18964
hi Delimiter        guifg=#00A0A0
hi Operator         guifg=#B0B0B0

hi link Character         Constant
hi link Boolean           Constant
hi link Float             Number
hi link Repeat            Statement
hi link Label             Statement
hi link Exception         Statement
hi link Include           PreProc
hi link Define            PreProc
hi link Macro             PreProc
hi link PreCondit         PreProc
hi link StorageClass      Type
hi link Structure         Type
hi link Typedef           Type
hi link Tag               Special
hi link SpecialChar       Special
hi link SpecialComment    Special
hi link Debug             Special

" Special for XML
hi link xmlTag            Keyword
hi link xmlTagName        Conditional
hi link xmlEndTag         Identifier

" Special for HTML
hi link htmlTag           Keyword
hi link htmlTagName       Conditional
hi link htmlEndTag        Identifier

" Special for Javascript
hi link javaScriptNumber  Number

" Special for Python
hi link pythonEscape      Keyword
hi pythonSpaceError ctermbg=red guibg=red

" Special for CSharp
hi  link csXmlTag         Keyword

" Diff
highlight DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
highlight DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
highlight DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

" Status line
hi User1                  guifg=#808080  guibg=black           " path
hi User2                  guifg=#ffffff  guibg=black  gui=bold " filename
hi User3                  guifg=#666666  guibg=black           " file type
hi User4                  guifg=#6CA84E  guibg=black  gui=bold " ale ok
hi User5                  guifg=#FC7A29  guibg=black  gui=bold " ale warn
hi User6                  guifg=#FC1928  guibg=black  gui=bold " ale error

" ALE linter (eslint etc)
hi ALEErrorSign           guifg=#FC1928
hi ALEWarningSign         guifg=#FC7A29
hi ALEError               guifg=#FC1928  gui=bold,undercurl  guisp=#fb0015
hi ALEWarning             guifg=#FC7A29  gui=bold,undercurl  guisp=#fd9216

" FZF colors
hi FzfFg                  guifg=#ffffff
hi FzfFgPlus              guifg=#56ffc4
hi FzfBg                  guibg=#000000 ctermbg=black
hi FzfBgPlus              guibg=#000000
hi FzfHighlight           guifg=#56ffc4
hi FzfHighlightPlus       guifg=#fd844f gui=bold
hi FzfInfo                guifg=#cccccc
hi FzfPrompt              guifg=#ffffff
hi FzfPointer             guifg=#999999
hi FzfMarker              guifg=#cccccc
hi FzfSpinner             guifg=#ff0000
hi FzfHeader              guifg=yellow

