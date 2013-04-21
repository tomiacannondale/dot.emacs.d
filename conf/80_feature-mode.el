;;========================================================
;; feature-mode設定
;; g clone git://github.com/michaelklishin/cucumber.el.git feature-mode
;;========================================================
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
