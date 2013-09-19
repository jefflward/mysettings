" my default color scheme

" color terminal settings (cterm=NONE needed to clear flags)
highlight Statement  ctermfg=red
highlight Comment    ctermfg=2
highlight Search     ctermfg=green ctermbg=0
highlight Constant   ctermfg=darkcyan  
highlight Float      ctermfg=Brown  
highlight Special    ctermfg=white
highlight Include    ctermfg=blue cterm=underline

" GUI settings
hi Normal         guifg=White     guibg=Black
"hi Ignore         guifg=bg
"hi Comment        guifg=lightgreen guibg=black
"hi adaComment     guifg=Green
"hi cComment       guifg=Green
"hi vimComment     guifg=Green
"hi xmlComment     guifg=Green
"hi xmlCommentPart guifg=Green
"hi cString        guifg=Cyan      guibg=black
"hi Constant       guifg=Magenta
hi Search         guifg=Red       guibg=black
""hi Special        guifg=Magenta
"hi Repeat         guifg=Yellow
"hi Include        guifg=Blue      gui=underline
"hi Identifier     guifg=Green3
"hi cStatement     guifg=Yellow
"hi cConditional   guifg=Yellow
"hi xmlCdataDecl   guifg=Cyan
"hi xmlString      guifg=Cyan
"hi xmlTag         guifg=Yellow
"hi xmlEndTag      guifg=DarkGrey
set guifont=monospace\ 8

" Python
au BufNewFile,BufRead *.py set ft=python
