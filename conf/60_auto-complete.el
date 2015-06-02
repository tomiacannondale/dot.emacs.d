;===================================================================
; auto-complete設定
;===================================================================
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(setq my-yasnippet-ac-sources
      '(ac-source-abbrev ac-source-words-in-same-mode-buffers ac-source-imenu ac-source-yasnippet))

(defun ac-ruby-mode-setup ()
  (setq-default ac-sources my-yasnippet-ac-sources))

(defun ac-hasckell-mode-setup ()
  (setq-default ac-sources my-yasnippet-ac-sources))

(defun ac-js2-mode-setup ()
  (setq-default ac-sources my-yasnippet-ac-sources))

(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'haskell-mode-hook 'ac-hasckell-mode-setup)
(add-hook 'js2-mode-hook 'ac-js2-mode-setup)
