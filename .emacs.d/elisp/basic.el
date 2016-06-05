;; START UP
(setq inhibit-startup-message 1)

;; FILES
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; ANSWER QUESTION
(fset 'yes-or-no-p 'y-or-n-p)

;; FONT
(add-to-list 'default-frame-alist '(font . "Ricty-13.5"))

;; BACKGROUND COLOR
;; if you use 8 colors terminal, comment out 3 lines including (require 'color-theme-molokai)
;; and uncomment (load "color.el") of init.el
(global-font-lock-mode t)
(require 'color-theme-molokai)
(color-theme-initialize)
(color-theme-molokai)

;; SCROLL
(setq scroll-conservatively 1
      scroll-margin 0
      scroll-step 1)

(global-set-key "\M-n" (lambda () (interactive) (scroll-up 1)))
(global-set-key "\M-p" (lambda () (interactive) (scroll-down 1)))

;; PAREN
(show-paren-mode t)

;; CURSOR
(setq cursor-in-non-selected-windows nil)

;; TRUNCATE LINES
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)

(defun toggle-truncate-lines ()
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))

(global-set-key "\C-x\C-l" 'toggle-truncate-lines)

;; TAB
(setq-default tab-width 4)
(setq indent-tabs-mode nil)

;; AUTO COMPLITE
(partial-completion-mode t)

;; LANGUAGE
(set-language-environment "Japanese")

;; CODE
(prefer-coding-system 'utf-8)

;; BAR
(set-scroll-bar-mode nil)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; MODE LINE
(which-function-mode t)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(setq mode-line-position
      '(:eval (format "L:[%%3l/%3d] C:[%%3c] %%Ib"
                      (count-lines (point-max)
                                   (point-min)))))

(defun count-lines-and-chars ()
  (if mark-active
      (format "[%3d:%4d] "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))

;; SELECT
(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)

;; DISABLE VC-GIT
(setq vc-handled-backends nil)

;; CLIPBOARD
(setq x-select-enable-clipboard t)

;; WIND MOVE
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)
