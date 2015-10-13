(require 'magit)

;; `M-x magit-status` で選択出来るディレクトリ
(setq magit-repository-directories '("~/.emacs.d" "~/.zsh.d" "~/code"))

;; magit-status
(define-key global-map "\C-xvd" 'magit-status)
