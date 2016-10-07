" -------------------------------------------------------------
" My original Vim color scheme
"
" Author: Tatsuya Yamasaki <httperror@404-notfound.jp>
" https://github.com/YamaCIR-KIT/dotfiles/.vim/colors/transparent.vim
" -------------------------------------------------------------


hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "transparent"


" -------------------------------------------------------------
"  Normal
" -------------------------------------------------------------
hi Normal          ctermfg=252 ctermbg=none  cterm=none

" -------------------------------------------------------------
"  Comment
" -------------------------------------------------------------
hi Comment         ctermfg=59  ctermbg=none cterm=none

" -------------------------------------------------------------
"  Constant
" -------------------------------------------------------------
hi Constant        ctermfg=141 ctermbg=none cterm=none
hi String          ctermfg=221 ctermbg=none cterm=none
hi Character       ctermfg=221 ctermbg=none cterm=none
hi Number          ctermfg=44  ctermbg=none cterm=none
hi Float           ctermfg=44  ctermbg=none cterm=none
hi Boolean         ctermfg=141 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Identifier
" -------------------------------------------------------------
hi Identifier      ctermfg=44  ctermbg=none cterm=none
hi Function        ctermfg=231 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Statement
" -------------------------------------------------------------
hi Statement       ctermfg=198 ctermbg=none cterm=none " goto break return continue asm
hi Conditional     ctermfg=198 ctermbg=none cterm=none " if else switch
hi Repeat          ctermfg=198 ctermbg=none cterm=none " while for do
hi Label           ctermfg=198 ctermbg=none cterm=none " case default
hi Tag             ctermfg=198 ctermbg=none cterm=none
hi Operator        ctermfg=198 ctermbg=none cterm=none
hi keyword         ctermfg=198 ctermbg=none cterm=none
hi Exception       ctermfg=198 ctermbg=none cterm=none

" -------------------------------------------------------------
"  PreProc
" -------------------------------------------------------------
hi PreProc         ctermfg=141 ctermbg=none cterm=none
hi Include         ctermfg=67  ctermbg=none cterm=none
hi Define          ctermfg=141 ctermbg=none cterm=none
hi Macro           ctermfg=141 ctermbg=none cterm=none
hi PreCondit       ctermfg=141 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Type
" -------------------------------------------------------------
hi Type            ctermfg=113 ctermbg=none cterm=none
hi StorageClass    ctermfg=208 ctermbg=none cterm=none
hi Structure       ctermfg=198 ctermbg=none cterm=none " struct, class
hi Typedef         ctermfg=113 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Special
" -------------------------------------------------------------
hi Special         ctermfg=44  ctermbg=none cterm=none
hi SpecialChar     ctermfg=202 ctermbg=none cterm=none
hi Delimiter       ctermfg=198 ctermbg=none cterm=none
hi SpecialComment  ctermfg=202 ctermbg=none cterm=none
hi Debug           ctermfg=198 ctermbg=none cterm=bold

" -------------------------------------------------------------
"  Underlined
" -------------------------------------------------------------
hi Underlined      ctermfg=161 ctermbg=none cterm=underline

" -------------------------------------------------------------
"  Ignore
" -------------------------------------------------------------
hi Ignore          ctermfg=252 ctermbg=none cterm=none

" -------------------------------------------------------------
"  Error
" -------------------------------------------------------------
hi Error           ctermfg=252 ctermbg=none cterm=none
hi ErrorMsg        ctermfg=161 ctermbg=none cterm=bold

" -------------------------------------------------------------
"  Cutsor and Line
" -------------------------------------------------------------
hi Cursor          ctermfg=233  ctermbg=252  cterm=none
hi CursorLine                   ctermbg=236  cterm=none
hi LineNr          ctermfg=59   ctermbg=none cterm=none " :set number
hi CursorLineNr    ctermfg=221  ctermbg=236  cterm=bold " :set number
hi MatchParen      ctermfg=252  ctermbg=none cterm=bold
hi Folded          ctermfg=67   ctermbg=none cterm=none

" -------------------------------------------------------------
"  Others
" -------------------------------------------------------------
hi Title           ctermfg=166

hi VertSplit       ctermfg=244  ctermbg=none  cterm=bold
hi VisualNOS                    ctermbg=238
hi Visual          ctermfg=234  ctermbg=246

hi NonText         ctermfg=59   ctermbg=none  cterm=none
hi SpecialKey      ctermfg=59   ctermbg=none  cterm=none

hi Search          ctermfg=none ctermbg=none cterm=reverse
hi IncSearch       ctermfg=none ctermbg=none cterm=reverse

hi WildMenu        ctermfg=221  ctermbg=236  cterm=bold
hi StatusLine      ctermfg=246  ctermbg=236  cterm=bold


set background=dark " because of ctermbg=234 bug
