(require 'mic-paren)
(paren-activate)
(setq paren-match-face '(underline paren-face))
;; boldにしたい時はこっちのコメントを外す
;; (setq paren-match-face 'bold paren-sexp-mode t)
(setq paren-sexp-mode t)
