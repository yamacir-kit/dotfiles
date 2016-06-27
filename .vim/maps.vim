" -------------------------------------------------------------------
"  NORMAL MAPPTINGS
" -------------------------------------------------------------------
nnoremap ; :
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <esc><esc> :<C-u>set nohlsearch<return>
nnoremap /          :<C-u>set hlsearch<return>/
nnoremap ?          :<C-u>set hlsearch<return>?
nnoremap *          :<C-u>set hlsearch<return>*
nnoremap #          :<C-u>set hlsearch<return>#

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

inoremap <C-a>mav  int<space>main(void)<space>{<return><return>}<esc>Oreturn<space>0;<esc>kO
inoremap <C-a>mai  int<space>main(int<space>argc,<space>char**<space>argv)<space>{<return><return>}<esc>Oreturn<space>0;<esc>kO

inoremap <C-a>nam  using<space>namespace<space>;<left>
inoremap <C-a>str  struct<space><space>{<return>};<esc>k$hi
inoremap <C-a>typ  typedef<space>
inoremap <C-a>cls  class<space><space>{<return>public:<return>private:<return>};<esc>h%hi
inoremap <C-a>if   if<space>()<space>{<return>}<esc>%2hi
inoremap <C-a>wh   while<space>()<space>{<return>}<esc>%2hi
inoremap <C-a>sw   switch<space>()<space>{<return>}<esc>%2hi
inoremap <C-a>for  for<space>(i=0;<space>;<space>i++)<esc>5hi

inoremap <C-a>pf   printf("\n");<esc>4hi

inoremap <C-a>out  std::cout<space><<<space><space><<<space>std::endl;<esc>13hi


" -------------------------------------------------------------------
"  Automatic Input of AutoText fot LaTeX
" -------------------------------------------------------------------
inoremap <C-a>big  \biggl(<space><space>\biggr)<esc>7hi

inoremap <C-a>beg  \begin{<return>\end{}<esc>x<C-v>k$A
inoremap <C-a>equ  \begin{equation}<return>\end{equation}<esc>O
inoremap <C-a>eqn  \begin{eqnarray}<return>\end{eqnarray}<esc>O

inoremap <C-a>fig  \begin{figure}[h]<return>\begin{center}<return>\includegraphics[width=1.0\hsize]{.eps}<return>\end{center}<return>\caption{}<return>\label{fig:}<return>\end{figure}
inoremap <C-a>tab  \begin{table}[h]<return>\begin{center}<return>\caption{}<return>\begin{tabular}{}<space>\hline<return>\end{tabular}<return>\label{tab:}<return>\end{center}<return>\end{table}
inoremap <C-a>des  \begin{description}<return>\item[]<space>\mbox{}<space>\\<return>\item[]<space>\mbox{}<space>\\<return>\end{description}
inoremap <C-a>enu  \begin{enumerate}<return>\item<space><return>\item<space><return>\end{enumerate}

inoremap <C-a>sec  \section{}<return>\setcounter{equation}{0}<return>\setcounter{figure}{0}<return>\setcounter{table}{0}<esc>3kA<left>
