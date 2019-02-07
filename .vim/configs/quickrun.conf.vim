let g:quickrun_config = {
\   'python' : {
\     'outputter' : 'error',
\     'outputter/error/success' : 'buffer',
\     'outputter/error/error'   : 'quickfix',
\     'outputter/buffer/close_on_empty' : 1,
\   },
\
\   "cpp/clang++" : {
\     "cmdopt" : "-std=c++1z -Wall",
\     "hook/time/enable" : 1
\   },
\
\   "tex" : {
\     "command" : "latexmk",
\     "outputter" : "error",
\     "outputter/error/success" : "null",
\     "outputter/error/error" : "quickfix",
\     "srcfile" : expand("%"),
\     "cmdopt" : "-pdfdvi -pv",
\     "hook/sweep/files" : [
\       "%S:p:r.aux",
\       "%S:p:r.bbl",
\       "%S:p:r.blg",
\       "%S:p:r.dvi",
\       "%S:p:r.fdb_latexmk",
\       "%S:p:r.fls",
\       "%S:p:r.log",
\       "%S:p:r.out",
\       "%S:p:r.toc"
\     ],
\     "exec" : "%c %o %a %s",
\   }
\ }

