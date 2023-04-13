" https://vim-jp.org/vimdoc-ja/syntax.html#scheme.vim

set autoindent
set complete+=k~/.meevax_completions
set foldlevel =0
set iskeyword =@,33,35-38,42-43,45-58,60-64,94,_,126 " https://lemniscus.hatenablog.com/entry/20120409/1333942456#iskeyword
set lisp

" (scheme r4rs appendix)
syntax keyword function bound-identifier=?
syntax keyword function construct-identifier
syntax keyword function free-identifier=?
syntax keyword function generate-identifier
syntax keyword function identifier->symbol
syntax keyword function identifier?
syntax keyword function unwrap-syntax

" (srfi 1)
syntax keyword function alist-cons
syntax keyword function alist-copy
syntax keyword function alist-delete
syntax keyword function alist-delete!
syntax keyword function any
syntax keyword function append!
syntax keyword function append-map
syntax keyword function append-map!
syntax keyword function append-reverse
syntax keyword function append-reverse!
syntax keyword function break
syntax keyword function break!
syntax keyword function car+cdr
syntax keyword function circular-list
syntax keyword function circular-list?
syntax keyword function concatenate
syntax keyword function concatenate!
syntax keyword function cons*
syntax keyword function count
syntax keyword function delete
syntax keyword function delete!
syntax keyword function delete-duplicates
syntax keyword function delete-duplicates!
syntax keyword function dotted-list?
syntax keyword function drop
syntax keyword function drop-right
syntax keyword function drop-right!
syntax keyword function drop-while
syntax keyword function eighth
syntax keyword function every
syntax keyword function fifth
syntax keyword function filter
syntax keyword function filter!
syntax keyword function filter-map
syntax keyword function find
syntax keyword function find-tail
syntax keyword function first
syntax keyword function fold
syntax keyword function fold-right
syntax keyword function fourth
syntax keyword function iota
syntax keyword function last
syntax keyword function last-pair
syntax keyword function length+
syntax keyword function list-index
syntax keyword function list-tabulate
syntax keyword function list=
syntax keyword function lset-adjoin
syntax keyword function lset-diff+intersection
syntax keyword function lset-diff+intersection!
syntax keyword function lset-difference
syntax keyword function lset-difference!
syntax keyword function lset-intersection
syntax keyword function lset-intersection!
syntax keyword function lset-union
syntax keyword function lset-union!
syntax keyword function lset-xor
syntax keyword function lset-xor!
syntax keyword function lset<=
syntax keyword function lset=
syntax keyword function map!
syntax keyword function map-in-order
syntax keyword function ninth
syntax keyword function not-pair?
syntax keyword function null-list?
syntax keyword function pair-fold
syntax keyword function pair-fold-right
syntax keyword function pair-for-each
syntax keyword function partition
syntax keyword function partition!
syntax keyword function proper-list?
syntax keyword function reduce
syntax keyword function reduce-right
syntax keyword function remove
syntax keyword function remove!
syntax keyword function reverse!
syntax keyword function second
syntax keyword function seventh
syntax keyword function sixth
syntax keyword function span
syntax keyword function span!
syntax keyword function split-at
syntax keyword function split-at!
syntax keyword function take
syntax keyword function take!
syntax keyword function take-right
syntax keyword function take-while
syntax keyword function take-while!
syntax keyword function tenth
syntax keyword function third
syntax keyword function unfold
syntax keyword function unfold-right
syntax keyword function unzip1
syntax keyword function unzip2
syntax keyword function unzip3
syntax keyword function unzip4
syntax keyword function unzip5
syntax keyword function xcons
syntax keyword function zip

" (srfi 8)
syntax keyword keyword receive

" (srfi 38)
syntax keyword function read-with-shared-structure
syntax keyword function read/ss
syntax keyword function write-with-shared-structure
syntax keyword function write/ss

" (srfi 45)
syntax keyword function eager
syntax keyword keyword lazy

" (srfi 78)
syntax keyword function check-passed?
syntax keyword function check-report
syntax keyword function check-reset!
syntax keyword function check-set-mode!
syntax keyword keyword check
syntax keyword keyword check-ec

" (srfi 211)
syntax keyword function er-macro-transformer
syntax keyword function identifier?
syntax keyword function make-syntactic-closure
syntax keyword function rsc-macro-transformer
syntax keyword function sc-macro-transformer

" (meevax ...)
syntax keyword function kernel-exception-handler-set!
syntax keyword keyword call-with-current-continuation!
syntax keyword keyword current
syntax keyword keyword install
syntax keyword macro quote-syntax

set lispwords+=check " (srfi 78)
set lispwords+=define-library
set lispwords+=define-record-type
set lispwords+=define-values
set lispwords+=let*-values
set lispwords+=let-values
set lispwords+=parameterize
set lispwords+=receive " (srfi 8)
set lispwords+=syntax-rules
set lispwords-=if
