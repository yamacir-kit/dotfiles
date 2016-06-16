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
"  Automatic Input of AutoText fot C++
" -------------------------------------------------------------------
inoremap <C-a>in  #include<space><><left>
inoremap <C-a>de  #define<space>

inoremap <C-a>mv  int<space>main(void)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO
inoremap <C-a>ma  int<space>main(int<space>argc,<space>char**<space>argv)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO

inoremap <C-a>na  using<space>namespace<space>;<left>
inoremap <C-a>st  struct<space><space>{<cr>};<esc>k$hi
inoremap <C-a>ty  typedef<space>
inoremap <C-a>cl  class<space><space>{<cr>public:<cr>private:<cr>};<esc>h%hi

inoremap <C-a>if  if<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>wh  while<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>sw  switch<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>fo  for<space>(i=0;<space>;<space>i++)<esc>5hi

inoremap <C-a>pf printf("\n");<esc>4hi


" -------------------------------------------------------------------
"  Automatic Input of AutoText fot LaTeX
" -------------------------------------------------------------------
inoremap <C-a>fig \begin{figure}[h]<cr>\begin{center}<cr>\includegraphics[width=1.0\hsize]{.eps}<cr>\end{center}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}
inoremap <C-a>equ \begin{equation}<cr>\end{equation}<esc>O
inoremap <C-a>eqn \begin{eqnarray}<cr>\end{eqnarray}<esc>O
