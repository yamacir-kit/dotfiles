  set background=dark
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
  let colors_name = "autumn_flavors"

" ---- Normal -------------------------------------------------
  hi Normal          ctermfg=252 ctermbg=234

" --- Comment -------------------------------------------------
  hi Comment         ctermfg=59  ctermbg=234 cterm=none

" --- Constant ------------------------------------------------
  hi Constant        ctermfg=141
  hi String          ctermfg=221             cterm=none
  hi Character       ctermfg=221
  hi Number          ctermfg=81              cterm=none
  hi Float           ctermfg=81              cterm=none
  hi Boolean         ctermfg=141             cterm=none

" --- Identifier ----------------------------------------------
  hi Identifier      ctermfg=44              cterm=none
  hi Function        ctermfg=44

" -- Statement ------------------------------------------------
  hi Statement       ctermfg=161
  hi Conditional     ctermfg=161
  hi Repeat          ctermfg=161
  hi Label           ctermfg=161
  hi Operator        ctermfg=161
  hi keyword         ctermfg=161
  hi Exception       ctermfg=161

" --- PreProc -------------------------------------------------
  hi PreProc         ctermfg=141
  hi Include         ctermfg=67
  hi Define          ctermfg=141
  hi Macro           ctermfg=141
  hi PreCondit       ctermfg=141

" --- Type ----------------------------------------------------
  hi Type            ctermfg=113
  hi StorageClass    ctermfg=208
  hi Structure       ctermfg=161
  hi Typedef         ctermfg=161

" --- Special ---------------------------------------------
  hi Special         ctermfg=202
  hi SpecialChar     ctermfg=202
  hi Tag             ctermfg=161
  hi Delimiter       ctermfg=161
  hi SpecialComment  ctermfg=202
  hi Debug           ctermfg=161             cterm=bold

" --- Underlined ------------------------------------------
  hi Underlined      ctermfg=81  ctermbg=234

" --- Ignore ----------------------------------------------
  hi Ignore          ctermfg=252 ctermbg=234

" --- Error -----------------------------------------------
  hi Error           ctermfg=161 ctermbg=234 cterm=bold

" --- Cursor and Line -------------------------------------
  hi Cursor          ctermfg=16  ctermbg=252
  hi CursorLine                  ctermbg=235 cterm=none
  hi CursorLineNr    ctermfg=221 ctermbg=235 cterm=bold

  hi LineNr          ctermfg=59  ctermbg=234
  hi MatchParen      ctermfg=81  ctermbg=234 cterm=bold

  hi Folded          ctermfg=67  ctermbg=234 cterm=none





hi Directory    ctermfg=81              cterm=bold





hi StatusLine   ctermfg=238 ctermbg=252
hi StatusLineNC ctermfg=244 ctermbg=234

hi Title        ctermfg=166

hi VertSplit    ctermfg=244 ctermbg=234 cterm=bold
hi VisualNOS                ctermbg=238
hi Visual       ctermfg=234 ctermbg=252


hi NonText      ctermfg=59
hi SpecialKey   ctermfg=59
