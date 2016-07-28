" -------------------------------------------------------------------
"  General
" -------------------------------------------------------------------
"let mapleader = "\<space>"


" -------------------------------------------------------------------
"  Normal
" -------------------------------------------------------------------
nnoremap ; :
nnoremap Y y$
nnoremap + <c-a>
nnoremap - <c-x>

nnoremap j gjzz
nnoremap k gkzz
nnoremap <down> gjzz
nnoremap <up> gkzz

nnoremap <c-j> o<esc>
nnoremap <c-k> O<esc>


" -------------------------------------------------------------------
"  Insert
" -------------------------------------------------------------------
inoremap <> <><left>
inoremap {} {}<left>
inoremap [] []<left>
inoremap () ()<left>
inoremap "" ""<left>
inoremap '' ''<left>
inoremap $$ $$<left>
inoremap && &&<left>
inoremap /* /*<space><space>*/<esc>2hi
inoremap （） （）<left>

inoremap <c-h> <esc>I
inoremap <c-j> <esc>o
inoremap <c-k> <esc>O
inoremap <c-l> <end>

inoremap <c-o> <c-o>:<c-u>

inoremap <down> <c-o>:<c-u>normal<space>gjzz<cr>
inoremap <up> <c-o>:<c-u>normal<space>gkzz<cr>


" -------------------------------------------------------------------
"  Visual
" -------------------------------------------------------------------
vnoremap ; :s/

vmap # <c-v>0I#<space><esc>
vmap / <c-v>0I//<space><esc>
vmap % <c-v>0I%<space><esc>


" -------------------------------------------------------------------
"  Command
" -------------------------------------------------------------------
nnoremap <esc><esc> :<c-u>noh<cr>

nnoremap / :<c-u>set<space>hlsearch<cr>/
nnoremap ? :<c-u>set<space>hlsearch<cr>?
nnoremap * :<c-u>set<space>hlsearch<cr>*
nnoremap # :<c-u>set<space>hlsearch<cr>#


" -------------------------------------------------------------------
"  AutoText fot C/C++
" -------------------------------------------------------------------
command! -nargs=? CppClass call s:InputCppClass(<f-args>)
function! s:InputCppClass(...)
  let str_name = "class ".a:1." {\n"
  let str_ctor = a:1."()\n{\n}\n"
  let str_dtor = "~".a:1."()\n{\n}\n"

  if a:0 > 0
    execute "normal I".str_name."public:\n".str_ctor."\n".str_dtor."\nprivate:\n};"."\<esc>"
  else
    echo "function InputCppClass needs an argument"
  endif
endfunction


" -------------------------------------------------------------------
"  AutoText fot LaTeX
" -------------------------------------------------------------------
command! -nargs=? LatexBegin call s:InputLatexBegin(<f-args>)
function! s:InputLatexBegin(...)
  if a:0 > 0
    let str_begin = "\\begin{".a:1."}\n"
    let str_end = "\\end{".a:1."}"
    execute "normal I".str_begin.str_end."\<esc>"
  else
    let str_begin = "\\begin{}\n"
    let str_end = "\\end{}"
    execute "normal I".str_begin.str_end."\<esc>"
  end
endfunction

inoremap <leader>big  \biggl(<space><space>\biggr)<esc>7hi
inoremap <leader>fig  \begin{figure}[h]<cr>\begin{center}<cr>\includegraphics[width=0.8\hsize]{.eps}<cr>\end{center}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}
inoremap <leader>tab  \begin{table}[h]<cr>\begin{center}<cr>\caption{}<cr>\begin{tabular}{}<space>\hline<cr>\end{tabular}<cr>\label{tab:}<cr>\end{center}<cr>\end{table}
inoremap <leader>des  \begin{description}<cr>\item[]<space>\mbox{}<space>\\<cr>\item[]<space>\mbox{}<space>\\<cr>\end{description}
inoremap <leader>enu  \begin{enumerate}<cr>\item<space><cr>\item<space><cr>\end{enumerate}
inoremap <leader>sec  \section{}<cr>\setcounter{equation}{0}<cr>\setcounter{figure}{0}<cr>\setcounter{table}{0}<esc>3kA<left>
inoremap <leader>ref  \ref{}<left>


" -------------------------------------------------------------------
"  NEW AutoText fot C/C++
" -------------------------------------------------------------------
inoremap <leader>inc  #include<space><><left>
inoremap <leader>def  #define<space>
inoremap <leader>main int<space>main(int<space>argc,<space>char**<space>argv)<space>{<cr><cr>}<esc>Oreturn<space>0;<esc>kO
inoremap <leader>out  std::cout<space><<<space><space><<<space>std::endl;<esc>13hi
