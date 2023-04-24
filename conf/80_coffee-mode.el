;;========================================================
;; coffee-mode設定
;; git clone https://github.com/defunkt/coffee-mode.git
;;========================================================
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
; coffee-modeでのインデント設定
;   https://github.com/defunkt/coffee-mode
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  #'(lambda() (coffee-custom)))
(define-key coffee-mode-map "\C-c\C-c" 'coffee-compile-file)
