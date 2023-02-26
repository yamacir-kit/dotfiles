" https://vim-jp.org/vimdoc-ja/syntax.html#scheme.vim

set autoindent
set complete+=k~/.meevax_completions
set lisp

" https://lemniscus.hatenablog.com/entry/20120409/1333942456#iskeyword
let &iskeyword = '@,33,35-38,42-43,45-58,60-64,94,_,126'

let &foldlevel = 0

" (scheme r4rs appendix)
syntax keyword function bound-identifier=?
syntax keyword function construct-identifier
syntax keyword function free-identifier=?
syntax keyword function generate-identifier
syntax keyword function identifier->symbol
syntax keyword function identifier?
syntax keyword function unwrap-syntax

" (srfi 1)
syntax keyword function
  \ alist-cons alist-copy alist-delete alist-delete! any append! append-map
  \ append-map! append-reverse append-reverse! break break! car+cdr
  \ circular-list circular-list? concatenate concatenate! cons* count delete
  \ delete! delete-duplicates delete-duplicates! dotted-list? drop drop-right
  \ drop-right! drop-while eighth every fifth filter filter! filter-map find
  \ find-tail first fold fold-right fourth iota last last-pair length+
  \ list-index list-tabulate list= lset-adjoin lset-diff+intersection
  \ lset-diff+intersection! lset-difference lset-difference! lset-intersection
  \ lset-intersection! lset-union lset-union! lset-xor lset-xor! lset<= lset=
  \ map! map-in-order ninth not-pair? null-list? pair-fold pair-fold-right
  \ pair-for-each partition partition! proper-list? reduce reduce-right remove
  \ remove! reverse! second seventh sixth span span! split-at split-at! take
  \ take! take-right take-while take-while! tenth third unfold unfold-right
  \ unzip1 unzip2 unzip3 unzip4 unzip5 xcons zip

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

set lispwords+=define-library
set lispwords+=define-values
set lispwords+=let*-values
set lispwords+=let-values
set lispwords+=parameterize
set lispwords+=syntax-rules
set lispwords-=if

" if has('conceal')
"   " syntax keyword Operator Alpha   conceal cchar=Α
"   " syntax keyword Operator Beta    conceal cchar=Β
"   " syntax keyword Operator Gamma   conceal cchar=Γ
"   " syntax keyword Operator Delta   conceal cchar=Δ
"   " syntax keyword Operator Epsilon conceal cchar=Ε
"   " syntax keyword Operator Zeta    conceal cchar=Ζ
"   " syntax keyword Operator Eta     conceal cchar=Η
"   " syntax keyword Operator Theta   conceal cchar=Θ
"   " syntax keyword Operator Iota    conceal cchar=Ι
"   " syntax keyword Operator Kappa   conceal cchar=Κ
"   " syntax keyword Operator Lamda   conceal cchar=Λ
"   " syntax keyword Operator Mu      conceal cchar=Μ
"   " syntax keyword Operator Nu      conceal cchar=Ν
"   " syntax keyword Operator Xi      conceal cchar=Ξ
"   " syntax keyword Operator Omicron conceal cchar=Ο
"   " syntax keyword Operator Pi      conceal cchar=Π
"   " syntax keyword Operator Rho     conceal cchar=Ρ
"   " syntax keyword Operator Sigma   conceal cchar=Σ
"   " syntax keyword Operator Tau     conceal cchar=Τ
"   " syntax keyword Operator Upsilon conceal cchar=Υ
"   " syntax keyword Operator Phi     conceal cchar=Φ
"   " syntax keyword Operator Chi     conceal cchar=Χ
"   " syntax keyword Operator Psi     conceal cchar=Ψ
"   " syntax keyword Operator Omega   conceal cchar=Ω
"
"   " syntax keyword Operator alpha   conceal cchar=α
"   " syntax keyword Operator beta    conceal cchar=β
"   " syntax keyword Operator gamma   conceal cchar=γ
"   " syntax keyword Operator delta   conceal cchar=δ
"   " syntax keyword Operator epsilon conceal cchar=ε
"   " syntax keyword Operator zeta    conceal cchar=ζ
"   " syntax keyword Operator eta     conceal cchar=η
"   " syntax keyword Operator theta   conceal cchar=θ
"   " syntax keyword Operator iota    conceal cchar=ι
"   " syntax keyword Operator kappa   conceal cchar=κ
"   " syntax keyword Operator lambda  conceal cchar=λ
"   " syntax keyword Operator mu      conceal cchar=μ
"   " syntax keyword Operator nu      conceal cchar=ν
"   " syntax keyword Operator xi      conceal cchar=ξ
"   " syntax keyword Operator omicron conceal cchar=ο
"   " syntax keyword Operator pi      conceal cchar=π
"   " syntax keyword Operator rho     conceal cchar=ρ
"   " syntax keyword Operator sigma   conceal cchar=σ
"   " syntax keyword Operator tau     conceal cchar=τ
"   " syntax keyword Operator upsilon conceal cchar=υ
"   " syntax keyword Operator phi     conceal cchar=φ
"   " syntax keyword Operator chi     conceal cchar=χ
"   " syntax keyword Operator psi     conceal cchar=ψ
"   " syntax keyword Operator omega   conceal cchar=ω
"
"   " syntax keyword SchemeConceal and  conceal cchar=∧
"   " syntax keyword SchemeConceal nand conceal cchar=⊼
"   " syntax keyword SchemeConceal nor  conceal cchar=⊽
"   " syntax keyword SchemeConceal not  conceal cchar=∼
"   " syntax keyword SchemeConceal or   conceal cchar=∨
"   " syntax keyword SchemeConceal xor  conceal cchar=⊻
"
"   " syntax keyword SchemeConceal intersection conceal cchar=∩
"   " syntax keyword SchemeConceal union        conceal cchar=∪
"
"   " syntax keyword SchemeConceal cons conceal cchar=∷
"
"   " syntax match Operator /\s)\+$/ oneline display conceal cchar=~
"
"   " syntax keyword SchemeConceal <= conceal cchar=≤
"   " syntax keyword SchemeConceal >= conceal cchar=≥
"
"   " syntax keyword SchemeConceal nabra  conceal cchar=∇
"
"   " syntax keyword SchemeConceal define conceal cchar=Δ
"   " ¶
"   " ↦
"   " Δ
"   " ⩴
"   " ⦀
"   " ∃
"   " ⨟
"   " ≜
"   " ≝
"   " ≡
"   " ≣
"
"   " syntax keyword SchemeConceal => conceal cchar=⇒
"
"   " syntax keyword SchemeConceal +      conceal cchar=Σ
"   " syntax keyword SchemeConceal *      conceal cchar=Π
"
"   " syntax match   SchemeConceal "'()"  conceal cchar=∅
"   " syntax match   SchemeConceal "'()"  conceal cchar=𝟘
"   " syntax match   SchemeConceal "'()"  conceal cchar=𝟎
"   " syntax match   SchemeConceal "'()"  conceal cchar=0̸
"   " syntax match   SchemeConceal "'()"  conceal cchar=Ø
"
"   " syntax keyword SchemeConceal member conceal cchar=∈
"   " syntax keyword SchemeConceal sqrt   conceal cchar=√
"
"   " syntax keyword SchemeConceal angle  conceal cchar=∠
"
"   " syntax keyword SchemeConceal integral conceal cchar=∫
"
"   highlight! link Conceal Operator
"
"   setlocal conceallevel=1
" endif
