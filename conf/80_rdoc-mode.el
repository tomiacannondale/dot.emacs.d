;;========================================================
;; rdoc-mode
;; ruby-modeに同封
;;========================================================
(load "rdoc-mode")
(autoload 'rdoc-mode "RDoc")
(add-to-list 'auto-mode-alist '("\\.rdoc$" . rdoc-mode))
