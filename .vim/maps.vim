" -------------------------------------------------------------------
"  VIM COMMAND MAPPING CHEAT SHEET
"
" (  RECURSIVE  ) (NON-RECURSIVE) (    UNMAP    ) (    MODE     )
"      map           noremap           unmap      normal,visual,op
"      nmap          nnoremap          nunmap         normal
"      xmap          xnoremap          xunmap         visual
"      cmap          cnoremap          cunmap       commad-line
"      omap          onoremap          ounmap     operator-pending
"      imap          inoremap          iunmap         insert
" -------------------------------------------------------------------

" -------------------------------------------------------------------
"  NORMAL MAPPTINGS
" -------------------------------------------------------------------
nnoremap ; :
nnoremap Y y$

nnoremap + <C-a>
nnoremap - <C-x>

imap <> <><left>
imap {} {}<left>
imap [] []<left>
imap () ()<left>
imap "" ""<left>
imap '' ''<left>
imap $$ $$<left>
imap /* /*<space><space>*/<esc>2hi

" -------------------------------------------------------------------
"  VERY VERY UGLY CODE BUT SIMPLE AND USEFUL
" -------------------------------------------------------------------
imap ;in  #include<space><>
inoremap ;de  #define<space>

inoremap ;mv  int<space>main(void)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO
inoremap ;ma  int<space>main(int<space>argc,<space>char**<space>argv)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO

inoremap ;na  using<space>namespace<space>;<left>
inoremap ;st  struct<space><space>{<cr>};<esc>k$hi
inoremap ;ty  typedef<space>
inoremap ;cl  class<space><space>{<cr>public:<cr>private:<cr>};<esc>h%hi

inoremap ;if  if<space>()<space>{<cr>}<esc>%2hi
inoremap ;wh  while<space>()<space>{<cr>}<esc>%2hi
inoremap ;sw  switch<space>()<space>{<cr>}<esc>%2hi
inoremap ;fo  for<space>(int<space>i=0;<space>;<space>i++)<esc>5hi

inoremap ;pf printf("\n");<esc>4hi
