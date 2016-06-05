;; 拡張子の関連付け
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
				("\\.sty$" . yatex-mode))
				auto-mode-alist))
	  (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; AMS-LaTeX を使う
(setq YaTeX-use-AMS-LaTeX t)

;; 漢字コードをUTF-8に設定
(setq YaTeX-kanji-code 4)

;; C-c C-t j
(setq tex-command "platex")

;; C-c C-t p
(setq dvi2-command "xdvi -geo 900x900+0+0 -s 6")

;; section型補間の規定値
(setq section-name "section")

;; 新規ファイル作成時に自動挿入されるファイル名
(setq YaTeX-template-file 
      (expand-file-name "~/Documents/LaTeX/Template/template.tex"))

;; Begin ショートカットの禁止(いきなり補完入力)
(setq YaTeX-no-begend-shortcut nil)

;; 自動改行の抑制
(add-hook 'yatex-mode-hook'(lambda ()(setq auto-fill-function nil)))

;; 以下フォントカラー
(setq YaTeX-use-hilit19 nil)
(setq YaTeX-use-font-lock t)

;; 基本的なシンタックスハイライトは /usr/share/emacs/site-lisp/yatex/yatexlib.el の1400行あたりを直接弄ったが，セクションに関してだけは見つからなかったので，ネットから見つけてきた色・サイズ変更のlispをここに書いて間に合せとする．
;; 文字サイズの変更が反映されるのはX上に限った話だから，セクショニングは色分けしておいた方がいいと聞くがTeXを非X環境下で書くことって先ず無いと思う．
;; 勉強不足だから分からんが，ここのheightの値は下位に対する相対値らしい
(custom-set-faces
 '(YaTeX-sectioning-0 ((((class color)) (:inherit YaTeX-sectioning-1 :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-1 ((((class color)) (:inherit YaTeX-sectioning-2 :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-2 ((((class color)) (:inherit YaTeX-sectioning-3 :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-3 ((((class color)) (:inherit YaTeX-sectioning-4 :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-4 ((((class color)) (:inherit YaTeX-sectioning-5 :foreground "#19AEB9" :height 1.1))))
 '(YaTeX-sectioning-5 ((((class color)) (:inherit YaTeX-sectioning-6 :foreground "#19AEB9"))))
 '(YaTeX-sectioning-6 ((((class color)) (:inherit variable-pitch :foreground "#19AEB9")))))

