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
imap && &&<left>
imap /* /*<space><space>*/<esc>2hi


" -------------------------------------------------------------------
"  Automatic Input of AutoText fot C++
" -------------------------------------------------------------------
inoremap <C-a>inc  #include<space><><left>
inoremap <C-a>def  #define<space>
inoremap <C-a>mav  int<space>main(void)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO
inoremap <C-a>mai  int<space>main(int<space>argc,<space>char**<space>argv)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO
inoremap <C-a>nam  using<space>namespace<space>;<left>
inoremap <C-a>str  struct<space><space>{<cr>};<esc>k$hi
inoremap <C-a>typ  typedef<space>
inoremap <C-a>cls  class<space><space>{<cr>public:<cr>private:<cr>};<esc>h%hi
inoremap <C-a>if   if<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>wh   while<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>sw   switch<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>for  for<space>(i=0;<space>;<space>i++)<esc>5hi

inoremap <C-a>pf printf("\n");<esc>4hi


" -------------------------------------------------------------------
"  Automatic Input of AutoText fot LaTeX
" -------------------------------------------------------------------
inoremap <C-a>fig \begin{figure}[h]<cr>\begin{center}<cr>\includegraphics[width=1.0\hsize]{.eps}<cr>\end{center}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}
inoremap <C-a>equ \begin{equation}<cr>\end{equation}<esc>O
inoremap <C-a>eqn \begin{eqnarray}<cr>\end{eqnarray}<esc>O
inoremap <C-a>sec \section{}<cr>\setcounter{equation}{0}<cr>\setcounter{figure}{0}<cr>\setcounter{table}{0}<esc>3kA<left>
inoremap <C-a>beg \begin{<cr>\end{}<esc>x<C-v>k$A
