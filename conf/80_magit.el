(require 'magit)

;; `M-x magit-status` で選択出来るディレクトリ
(setq magit-repository-directories
      '(
        ("~/.emacs.d" . 0)
        ("~/.zsh.d" . 0)
        ("~/code" . 1)
        )
      )

;; magit-status
(define-key global-map "\C-xvd" 'magit-status)
