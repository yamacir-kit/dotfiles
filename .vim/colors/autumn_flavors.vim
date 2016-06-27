" -------------------------------------------------------------
" My original Vim color scheme
"
" Author: Tatsuya Yamasaki <httperror@404-notfound.jp>
" https://github.com/YamaCIR-KIT/dotfiles/.vim/colors/autumn_flavors.vim
" -------------------------------------------------------------


hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "autumn_flavors"


" -------------------------------------------------------------
"  Normal
" -------------------------------------------------------------
hi Normal          ctermfg=252 ctermbg=234 cterm=none

" -------------------------------------------------------------
"  Comment
" -------------------------------------------------------------
hi Comment         ctermfg=59  ctermbg=234 cterm=none

" -------------------------------------------------------------
"  Constant
" -------------------------------------------------------------
hi Constant        ctermfg=141 ctermbg=234 cterm=none
hi String          ctermfg=221 ctermbg=234 cterm=none
hi Character       ctermfg=221 ctermbg=234 cterm=none
hi Number          ctermfg=44  ctermbg=234 cterm=none
hi Float           ctermfg=44  ctermbg=234 cterm=none
hi Boolean         ctermfg=141 ctermbg=234 cterm=none

" -------------------------------------------------------------
"  Identifier
" -------------------------------------------------------------
hi Identifier      ctermfg=44  ctermbg=234 cterm=none
hi Function        ctermfg=231 ctermbg=234 cterm=none

" -------------------------------------------------------------
"  Statement
" -------------------------------------------------------------
hi Statement       ctermfg=198 ctermbg=234 cterm=none " goto break return continue asm
hi Conditional     ctermfg=198 ctermbg=234 cterm=none " if else switch
hi Repeat          ctermfg=198 ctermbg=234 cterm=none " while for do
hi Label           ctermfg=198 ctermbg=234 cterm=none " case default
hi Tag             ctermfg=198 ctermbg=234 cterm=none
hi Operator        ctermfg=198 ctermbg=234 cterm=none
hi keyword         ctermfg=198 ctermbg=234 cterm=none
hi Exception       ctermfg=198 ctermbg=234 cterm=none

" -------------------------------------------------------------
"  PreProc
" -------------------------------------------------------------
hi PreProc         ctermfg=141 ctermbg=234 cterm=none
hi Include         ctermfg=67  ctermbg=234 cterm=none
hi Define          ctermfg=141 ctermbg=234 cterm=none
hi Macro           ctermfg=141 ctermbg=234 cterm=none
hi PreCondit       ctermfg=141 ctermbg=234 cterm=none

" -------------------------------------------------------------
"  Type
" -------------------------------------------------------------
hi Type            ctermfg=113 ctermbg=234 cterm=none
hi StorageClass    ctermfg=208 ctermbg=234 cterm=none
hi Structure       ctermfg=198 ctermbg=234 cterm=none " struct, class
hi Typedef         ctermfg=113 ctermbg=234 cterm=none

" -------------------------------------------------------------
"  Special
" -------------------------------------------------------------
hi Special         ctermfg=44  ctermbg=234 cterm=none
hi SpecialChar     ctermfg=202 ctermbg=234 cterm=none
hi Delimiter       ctermfg=198 ctermbg=234 cterm=none
hi SpecialComment  ctermfg=202 ctermbg=234 cterm=none
hi Debug           ctermfg=198 ctermbg=234 cterm=bold

" -------------------------------------------------------------
"  Underlined
" -------------------------------------------------------------
hi Underlined      ctermfg=161 ctermbg=234 cterm=underline

" -------------------------------------------------------------
"  Ignore
" -------------------------------------------------------------
hi Ignore          ctermfg=252 ctermbg=234 cterm=none

" -------------------------------------------------------------
"  Error
" -------------------------------------------------------------
hi Error           ctermfg=161 ctermbg=234 cterm=underline

" -------------------------------------------------------------
"  Cutsor and Line
" -------------------------------------------------------------
hi Cursor          ctermfg=16  ctermbg=252 cterm=none
hi CursorIM        ctermfg=221 ctermbg=252 cterm=bold " isn't work
hi CursorLine                  ctermbg=236 cterm=none
hi CursorLineNr    ctermfg=221 ctermbg=236 cterm=bold
hi CursorColumn                ctermbg=236 cterm=none
hi LineNr          ctermfg=59  ctermbg=234 cterm=none
hi MatchParen      ctermfg=252 ctermbg=236 cterm=bold
hi Folded          ctermfg=67  ctermbg=234 cterm=none

" -------------------------------------------------------------
"  Others
" -------------------------------------------------------------
hi Title           ctermfg=166

hi VertSplit       ctermfg=244 ctermbg=234 cterm=bold
hi VisualNOS                   ctermbg=238
hi Visual          ctermfg=234 ctermbg=246

hi NonText         ctermfg=59
hi SpecialKey      ctermfg=59

hi Search          ctermfg=none ctermbg=none cterm=reverse
hi IncSearch       ctermfg=none ctermbg=none cterm=reverse


" 58

" because of ctermbg=234 bug
set background=dark
