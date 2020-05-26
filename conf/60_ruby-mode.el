;;==================================================================
;; ruby-modeの設定
;;==================================================================
(setq load-path (cons "~/.emacs.d/el-get/ruby-mode" load-path))
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.prawn$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

(require 'ruby-electric)
(require 'ruby-end)

(with-eval-after-load 'ruby-mode
  (setq ruby-insert-encoding-magic-comment nil)
  )

;; ruby-modeの時は行末の空白を目立たせる
(add-hook 'ruby-mode-hook '(lambda () (setq-local show-trailing-whitespace t)))
;; デフォルトのチェッカーをrubyにする
;; 必要に応じて
;;     M-x add-dir-local-variable RET ruby-mode RET flycheck-checker RET 'ruby-rubocop RET
;; とする
(add-hook 'ruby-mode-hook '(lambda () (setq-local flycheck-checker 'ruby)))
