;;==================================================================
;; ruby-modeの設定
;;==================================================================
(setq load-path (cons "~/.emacs.d/el-get/ruby-mode" load-path))
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.prawn$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

(with-eval-after-load 'ruby-mode
  (setq ruby-insert-encoding-magic-comment nil)
  )

;; 定義ブロック補完
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
