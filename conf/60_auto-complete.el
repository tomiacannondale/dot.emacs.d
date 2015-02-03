;===================================================================
; auto-complete設定
;===================================================================
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(defun ac-ruby-mode-setup ()
  (setq-default ac-sources '(ac-source-yasnippet)))

(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
