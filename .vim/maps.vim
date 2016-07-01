" -------------------------------------------------------------------
"  NORMAL MAPPTINGS
" -------------------------------------------------------------------
nnoremap ; :
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <esc><esc> :<C-u>nohl<cr>
nnoremap / :<C-u>set<space>hlsearch<cr>/
nnoremap ? :<C-u>set<space>hlsearch<cr>?
nnoremap * :<C-u>set<space>hlsearch<cr>*
nnoremap # :<C-u>set<space>hlsearch<cr>#

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
"  Automatic Input of AutoText fot C/C++
" -------------------------------------------------------------------
inoremap <C-a>inc  #include<space><><left>
inoremap <C-a>def  #define<space>

inoremap <C-a>mav  int<space>main(void)<space>{<cr><cr>}<esc>Ocr<space>0;<esc>kO
inoremap <C-a>mai  int<space>main(int<space>argc,<space>char**<space>argv)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO

inoremap <C-a>nam  using<space>namespace<space>;<left>
inoremap <C-a>str  struct<space><space>{<cr>};<esc>k$hi
inoremap <C-a>typ  typedef<space>
inoremap <C-a>cls  class<space><space>{<cr>public:<cr>private:<cr>};<esc>h%hi
inoremap <C-a>if   if<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>wh   while<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>sw   switch<space>()<space>{<cr>}<esc>%2hi
inoremap <C-a>for  for<space>(i=0;<space>;<space>i++)<esc>5hi

inoremap <C-a>pf   printf("\n");<esc>4hi

inoremap <C-a>out  std::cout<space><<<space><space><<<space>std::endl;<esc>13hi


" -------------------------------------------------------------------
"  Automatic Input of AutoText fot LaTeX
" -------------------------------------------------------------------
inoremap <C-a>big  \biggl(<space><space>\biggr)<esc>7hi

inoremap <C-a>beg  \begin{<cr>\end{}<esc>x<C-v>k$A
inoremap <C-a>equ  \begin{equation}<cr>\end{equation}<esc>O
inoremap <C-a>eqn  \begin{eqnarray}<cr>\end{eqnarray}<esc>O

inoremap <C-a>fig  \begin{figure}[h]<cr>\begin{center}<cr>\includegraphics[width=1.0\hsize]{.eps}<cr>\end{center}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}
inoremap <C-a>tab  \begin{table}[h]<cr>\begin{center}<cr>\caption{}<cr>\begin{tabular}{}<space>\hline<cr>\end{tabular}<cr>\label{tab:}<cr>\end{center}<cr>\end{table}
inoremap <C-a>des  \begin{description}<cr>\item[]<space>\mbox{}<space>\\<cr>\item[]<space>\mbox{}<space>\\<cr>\end{description}
inoremap <C-a>enu  \begin{enumerate}<cr>\item<space><cr>\item<space><cr>\end{enumerate}

inoremap <C-a>sec  \section{}<cr>\setcounter{equation}{1}<cr>\setcounter{figure}{0}<cr>\setcounter{table}{0}<esc>3kA<left>
