" --------------------------------------------------------------
"  My original Vim color scheme
"
"  Author: Tatsuya Yamasaki <httperror@404-notfound.jp>
"  https://github.com/YamaCIR-KIT/dotfiles/.vim/colors/hoge.vim
" --------------------------------------------------------------


highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "hoge"


" -- General ---------------------------------------------------
highlight Normal          ctermfg=252  ctermbg=none cterm=none

highlight Comment         ctermfg=059  ctermbg=none cterm=none
highlight Normal          ctermfg=252  ctermbg=none cterm=none

highlight Cursor          ctermfg=233  ctermbg=none cterm=none
highlight CursorLine      ctermfg=none ctermbg=236  cterm=none
highlight CursorLineNr    ctermfg=221  ctermbg=236  cterm=bold
highlight LineNr          ctermfg=059  ctermbg=none cterm=none












" -- Constants -------------------------------------------------
highlight Constant        ctermfg=141  ctermbg=none cterm=none
highlight String          ctermfg=221  ctermbg=none cterm=none
highlight Character       ctermfg=221  ctermbg=none cterm=none
highlight Number          ctermfg=044  ctermbg=none cterm=none
highlight Float           ctermfg=044  ctermbg=none cterm=none
highlight Boolean         ctermfg=141  ctermbg=none cterm=none

" -------------------------------------------------------------
"  Identifier
" -------------------------------------------------------------
highlight Identifier      ctermfg=44  ctermbg=none cterm=none
highlight Function        ctermfg=231 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Statement
" -------------------------------------------------------------
highlight Statement       ctermfg=198 ctermbg=none cterm=none
highlight Conditional     ctermfg=198 ctermbg=none cterm=none
highlight Repeat          ctermfg=198 ctermbg=none cterm=none
highlight Label           ctermfg=198 ctermbg=none cterm=none
highlight Tag             ctermfg=198 ctermbg=none cterm=none
highlight Operator        ctermfg=198 ctermbg=none cterm=none
highlight keyword         ctermfg=198 ctermbg=none cterm=none
highlight Exception       ctermfg=198 ctermbg=none cterm=none

" -------------------------------------------------------------
"  PreProc
" -------------------------------------------------------------
highlight PreProc         ctermfg=141 ctermbg=none cterm=none
highlight Include         ctermfg=67  ctermbg=none cterm=none
highlight Define          ctermfg=141 ctermbg=none cterm=none
highlight Macro           ctermfg=141 ctermbg=none cterm=none
highlight PreCondit       ctermfg=141 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Type
" -------------------------------------------------------------
highlight Type            ctermfg=113 ctermbg=none cterm=none
highlight StorageClass    ctermfg=208 ctermbg=none cterm=none
highlight Structure       ctermfg=198 ctermbg=none cterm=none
highlight Typedef         ctermfg=113 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Special
" -------------------------------------------------------------
highlight Special         ctermfg=44  ctermbg=none cterm=none
highlight SpecialChar     ctermfg=202 ctermbg=none cterm=none
highlight Delimiter       ctermfg=198 ctermbg=none cterm=none
highlight SpecialComment  ctermfg=202 ctermbg=none cterm=none
highlight Debug           ctermfg=198 ctermbg=none cterm=bold

" -------------------------------------------------------------
"  Underlined
" -------------------------------------------------------------
highlight Underlined      ctermfg=161 ctermbg=none cterm=underline

" -------------------------------------------------------------
"  Ignore
" -------------------------------------------------------------
highlight Ignore          ctermfg=252 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Error
" -------------------------------------------------------------
highlight Error           ctermfg=252  ctermbg=none cterm=none
highlight ErrorMsg        ctermfg=161  ctermbg=none cterm=bold
" highlight WorningMsg

" -------------------------------------------------------------
"  Cutsor and Line
" -------------------------------------------------------------
highlight MatchParen      ctermfg=252  ctermbg=none cterm=bold
highlight Folded          ctermfg=67   ctermbg=none cterm=none

" -------------------------------------------------------------
"  Others
" -------------------------------------------------------------
highlight Title           ctermfg=166

highlight VertSplit       ctermfg=244  ctermbg=none cterm=bold
highlight VisualNOS                    ctermbg=238
highlight Visual          ctermfg=234  ctermbg=246

highlight NonText         ctermfg=59   ctermbg=none  cterm=none
highlight SpecialKey      ctermfg=59   ctermbg=none  cterm=none

highlight Search          ctermfg=none ctermbg=none cterm=reverse
highlight IncSearch       ctermfg=none ctermbg=none cterm=reverse

highlight WildMenu        ctermfg=221  ctermbg=236  cterm=bold
highlight StatusLine      ctermfg=245  ctermbg=236  cterm=bold


" -- Pull-down Manu --------------------------------------------
highlight Pmenu           ctermfg=059  ctermbg=236  cterm=none
highlight PmenuSel        ctermfg=220  ctermbg=236  cterm=bold


" -- Completion ------------------------------------------------
highlight SpellBad        ctermfg=161  ctermbg=none cterm=bold,underline


" -- Background ------------------------------------------------
set background=dark " because of ctermbg=234 bug
