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

" ---- Normal -------------------------------------------------
hi Normal          ctermfg=252 ctermbg=234 cterm=none      " ok

" --- Comment -------------------------------------------------
hi Comment         ctermfg=59  ctermbg=234 cterm=none      " ok

" --- Constant ------------------------------------------------
hi Constant        ctermfg=44  ctermbg=234 cterm=none      " ok
hi String          ctermfg=221 ctermbg=234 cterm=none
hi Character       ctermfg=221 ctermbg=234 cterm=none
hi Number          ctermfg=44  ctermbg=234 cterm=none      " ok
hi Float           ctermfg=44  ctermbg=234 cterm=none
hi Boolean         ctermfg=44  ctermbg=234 cterm=none

" --- Identifier ----------------------------------------------
hi Identifier      ctermfg=44  ctermbg=234 cterm=none      " ok
hi Function        ctermfg=81  ctermbg=234 cterm=none

" -- Statement ------------------------------------------------
hi Statement       ctermfg=161 ctermbg=234 cterm=none
hi Conditional     ctermfg=161 ctermbg=234 cterm=none
hi Repeat          ctermfg=161 ctermbg=234 cterm=none
hi Label           ctermfg=161 ctermbg=234 cterm=bold
hi Operator        ctermfg=161 ctermbg=234 cterm=none
hi keyword         ctermfg=161 ctermbg=234 cterm=none
hi Exception       ctermfg=161 ctermbg=234 cterm=none

" --- PreProc -------------------------------------------------
hi PreProc         ctermfg=141 ctermbg=234 cterm=none      " ok
hi Include         ctermfg=67  ctermbg=234 cterm=none
hi Define          ctermfg=141 ctermbg=234 cterm=none
hi Macro           ctermfg=141 ctermbg=234 cterm=none
hi PreCondit       ctermfg=141 ctermbg=234 cterm=none

" --- Type ----------------------------------------------------
hi Type            ctermfg=113 ctermbg=234 cterm=none
hi StorageClass    ctermfg=208 ctermbg=234 cterm=none
hi Structure       ctermfg=161 ctermbg=234 cterm=none
hi Typedef         ctermfg=161 ctermbg=234 cterm=none

" --- Special -------------------------------------------------
hi Special         ctermfg=202 ctermbg=234 cterm=none
hi SpecialChar     ctermfg=202 ctermbg=234 cterm=none
hi Tag             ctermfg=161 ctermbg=234 cterm=none
hi Delimiter       ctermfg=161 ctermbg=234 cterm=none
hi SpecialComment  ctermfg=202 ctermbg=234 cterm=none
hi Debug           ctermfg=161 ctermbg=234 cterm=bold

" --- Underlined ----------------------------------------------
hi Underlined      ctermfg=81  ctermbg=234 cterm=none

" --- Ignore --------------------------------------------------
hi Ignore          ctermfg=252 ctermbg=234 cterm=none

" --- Error ---------------------------------------------------
hi Error           ctermfg=161 ctermbg=234 cterm=underline

" --- Cursor and Line -----------------------------------------
hi Cursor          ctermfg=16  ctermbg=252 cterm=none
hi CursorIM        ctermfg=221 ctermbg=252 cterm=bold      " isn't work
hi CursorLine                  ctermbg=236 cterm=none
hi CursorLineNr    ctermfg=221 ctermbg=236 cterm=bold
hi LineNr          ctermfg=59  ctermbg=234 cterm=none
hi MatchParen      ctermfg=252 ctermbg=236 cterm=bold      " ok
hi Folded          ctermfg=67  ctermbg=234 cterm=none      " ok

" --- Others --------------------------------------------------
hi Title           ctermfg=166
                   
hi VertSplit       ctermfg=244 ctermbg=234 cterm=bold
hi VisualNOS                   ctermbg=238
hi Visual          ctermfg=234 ctermbg=246
                   
hi NonText         ctermfg=59
hi SpecialKey      ctermfg=59

" because of ctermbg=234 bug
set background=dark
