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
imap /* /*<space><space>*/<left><left><left>


" -------------------------------------------------------------------
"  VERY VERY UGLY CODE BUT SIMPLE AND USEFUL
" -------------------------------------------------------------------
imap in; #include<space><>
imap de; #define<space>

imap mv; int<space>main()void<right><space>{}<cr><cr><esc>Oreturn<space>0;<esc>kO
imap ma; int<space>main()int<space>argc,<space>char**<space>argv<right><space>{}<cr><cr><esc>Oreturn<space>0;<esc>kO

imap na; using<space>namespace<space>;<left>
imap st; struct<space><space>{}<cr><right>;<esc>k2whi
imap ty; typedef<space>

imap if; if<space>()
imap if( if;<right><space>{}<cr><esc>%2hi
imap wh; while<space>()
imap wh( while;<right><space>{}<cr><esc>%2hi
imap sw; switch<space>()<right><space>{}<cr><esc>%2hi

imap fr; for<space>()
imap fr( fr;<right><space>{}<cr><esc>%2hi
imap fri; fr;int<space>i=0;<space>;<space>i++<esc>4hi
imap fri( fr(int<space>i=0;<space>;<space>i++<esc>4hi

imap pf; printf()""\n<esc>A;<esc>4hi
