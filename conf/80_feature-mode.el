;;========================================================
;; feature-mode設定
;; g clone git://github.com/michaelklishin/cucumber.el.git feature-mode
;;========================================================
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(defun my-feature-single-veriry ()
  (interactive)
  (rspec-compile
   (concat (buffer-file-name) ":" (number-to-string (line-number-at-pos)))
   (rspec-core-options)))

(defun my-feature-veriry ()
  (interactive)
  (rspec-compile (buffer-file-name) (rspec-core-options)))

(define-key feature-mode-map (kbd "\C-c,v") 'my-feature-veriry)
(define-key feature-mode-map (kbd "\C-c,s") 'my-feature-single-veriry)
