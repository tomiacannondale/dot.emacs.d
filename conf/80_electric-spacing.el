(require 'electric-spacing)
(add-to-list 'electric-spacing-regexp-pairs
             '("{\\|}" . "[0-9A-Za-z]"))
(add-to-list 'electric-spacing-regexp-pairs
             '("[0-9A-Za-z]" . "{\\|}"))
(make-local-variable 'electric-spacing-regexp-pairs)

(add-hook 'ruby-mode-hook 'electric-spacing-mode)
