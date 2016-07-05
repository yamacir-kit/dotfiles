" -------------------------------------------------------------------
"  Prefix Keys
" -------------------------------------------------------------------
nnoremap [Abbrev] <nop>
nnoremap <space> [Abbrev]


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

inoremap <C-h> <esc>I
inoremap <C-j> <esc>o
inoremap <C-k> <esc>O
inoremap <C-l> <end>


" -------------------------------------------------------------------
"  Automatic Input of AutoText fot C/C++
" -------------------------------------------------------------------
nnoremap <space>inc  i#include<space><><left>
nnoremap <space>def  i#define<space>

nnoremap <space>mav  iint<space>main(void)<space>{<cr><cr>}<esc>Ocr<space>0;<esc>kO
nnoremap <space>mai  iint<space>main(int<space>argc,<space>char**<space>argv)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO

nnoremap <space>nam  iusing<space>namespace<space>;<left>
nnoremap <space>str  istruct<space><space>{<cr>};<esc>k$hi
nnoremap <space>typ  itypedef<space>
nnoremap <space>cls  iclass<space><space>{<cr>public:<cr>private:<cr>};<esc>h%hi
nnoremap <space>if   iif<space>()<space>{<cr>}<esc>%2hi
nnoremap <space>wh   iwhile<space>()<space>{<cr>}<esc>%2hi
nnoremap <space>sw   iswitch<space>()<space>{<cr>}<esc>%2hi
nnoremap <space>for  ifor<space>(i=0;<space>;<space>i++)<esc>5hi

nnoremap <space>pf   iprintf("\n");<esc>4hi

nnoremap <space>out  istd::cout<space><<<space><space><<<space>std::endl;<esc>13hi


" -------------------------------------------------------------------
"  Automatic Input of AutoText fot LaTeX
" -------------------------------------------------------------------
nnoremap <space>big  i\biggl(<space><space>\biggr)<esc>7hi

nnoremap <space>beg  i\begin{<cr>\end{}<esc>x<C-v>k$A
nnoremap <space>equ  i\begin{equation}<cr>\end{equation}<esc>O
nnoremap <space>eqn  i\begin{eqnarray}<cr>\end{eqnarray}<esc>O

nnoremap <space>fig  i\begin{figure}[h]<cr>\begin{center}<cr>\includegraphics[width=1.0\hsize]{.eps}<cr>\end{center}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}
nnoremap <space>tab  i\begin{table}[h]<cr>\begin{center}<cr>\caption{}<cr>\begin{tabular}{}<space>\hline<cr>\end{tabular}<cr>\label{tab:}<cr>\end{center}<cr>\end{table}
nnoremap <space>des  i\begin{description}<cr>\item[]<space>\mbox{}<space>\\<cr>\item[]<space>\mbox{}<space>\\<cr>\end{description}
nnoremap <space>enu  i\begin{enumerate}<cr>\item<space><cr>\item<space><cr>\end{enumerate}

nnoremap <space>sec  i\section{}<cr>\setcounter{equation}{1}<cr>\setcounter{figure}{0}<cr>\setcounter{table}{0}<esc>3kA<left>
