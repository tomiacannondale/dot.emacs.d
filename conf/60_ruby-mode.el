;;==================================================================
;; ruby-modeの設定
;;==================================================================
(setq load-path (cons "~/.emacs.d/elisp/ruby-mode" load-path))
(add-hook 'ruby-mode-hook
          '(lambda ()
           (inf-ruby-keys)))
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.prawn$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

;; 定義ブロック補完
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
