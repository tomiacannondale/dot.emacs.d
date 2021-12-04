;;; 80_magit --- magit setting file

;;; Commentary:

;;; Code:

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

(custom-set-variables
 '(git-commit-major-mode 'gfm-mode)
 ;; git-commitでauto-fillを無効にだけしたい
 '(git-commit-setup-hook '(git-commit-save-message
                           git-commit-setup-changelog-support
                           git-commit-propertize-diff
                           bug-reference-mode
                           with-editor-usage-message))
 )

(provide '80_magit)
;;; 80_magit.el ends here
