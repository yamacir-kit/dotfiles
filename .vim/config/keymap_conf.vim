" -- Normal ----------------------------------------------------
nnoremap ;  :
nnoremap Y  y$
nnoremap x  "_x
nnoremap +  <c-a>
nnoremap -  <c-x>

nnoremap j gjzz
nnoremap k gkzz

nnoremap <down>     gjzz
nnoremap <up>       gkzz
nnoremap <pagedown> <pagedown>zz
nnoremap <pageup>   <pageup>zz

" toggle "
nnoremap <silent> <leader>gg  :<c-u>GitGutterToggle<cr>

" git stage "
nnoremap <silent> <leader>gs  :<c-u>GitGutterStageHunk<cr>

" git revert "
nnoremap <silent> <leader>gr  :<c-u>GitGutterUndoHunk<cr>

" git commit "
nnoremap <silent> <leader>c   :!git<space>commit<space>-v<cr>2><space>/dev/null


" -- Insert ----------------------------------------------------
inoremap <>  <><left>
inoremap {}  {}<left>
inoremap []  []<left>
inoremap ()  ()<left>

inoremap ""  ""<left>
inoremap ''  ''<left>

inoremap $$  $$<left>
" inoremap /*  /*<space><space>*/<esc>2hi

inoremap <c-o> <c-o>:<c-u>

inoremap <down>      <c-o>:<c-u>normal<space>gjzz<cr>
inoremap <up>        <c-o>:<c-u>normal<space>gkzz<cr>
inoremap <pagedown>  <pagedown><c-o>:<c-u>normal<space>zz<cr>
inoremap <pageup>    <pageup><c-o>:<c-u>normal<space>zz<cr>


" -- Visual ----------------------------------------------------
vnoremap ;  :s/
vnoremap >  >gv
vnoremap <  <gv

vnoremap "  <c-v>0I"<space><esc>
vnoremap #  <c-v>0I#<space><esc>
vnoremap /  <c-v>0I//<space><esc>
vnoremap %  <c-v>0I%<space><esc>

vmap v      <Plug>(expand_region_expand)
vmap <c-v>  <Plug>(expand_region_shrink)


" -- Command ---------------------------------------------------
nnoremap /  :<c-u>set<space>hlsearch<cr>/
nnoremap ?  :<c-u>set<space>hlsearch<cr>?
nnoremap *  :<c-u>set<space>hlsearch<cr>*
nnoremap #  :<c-u>set<space>hlsearch<cr>#


" -- LaTeX -----------------------------------------------------
" command! -nargs=? LatexBegin call s:InputLatexBegin(<f-args>)
" function! s:InputLatexBegin(...)
"   if a:0 > 0
"     let str_begin = "\\begin{".a:1."}\n"
"     let str_end = "\\end{".a:1."}"
"     execute "normal I".str_begin.str_end."\<esc>"
"   else
"     let str_begin = "\\begin{}\n"
"     let str_end = "\\end{}"
"     execute "normal I".str_begin.str_end."\<esc>"
"   end
" endfunction
" 
" inoremap <leader>big  \biggl(<space><space>\biggr)<esc>7hi
" inoremap <leader>fig  \begin{figure}[h]<cr>\begin{center}<cr>\includegraphics[width=0.8\hsize]{.eps}<cr>\end{center}<cr>\caption{}<cr>\label{fig:}<cr>\end{figure}
" inoremap <leader>tab  \begin{table}[h]<cr>\begin{center}<cr>\caption{}<cr>\begin{tabular}{}<space>\hline<cr>\end{tabular}<cr>\label{tab:}<cr>\end{center}<cr>\end{table}
" inoremap <leader>des  \begin{description}<cr>\item[]<space>\mbox{}<space>\\<cr>\item[]<space>\mbox{}<space>\\<cr>\end{description}
" inoremap <leader>enu  \begin{enumerate}<cr>\item<space><cr>\item<space><cr>\end{enumerate}
" inoremap <leader>sec  \section{}<cr>\setcounter{equation}{0}<cr>\setcounter{figure}{0}<cr>\setcounter{table}{0}<esc>3kA<left>
" inoremap <leader>ref  \ref{}<left>
