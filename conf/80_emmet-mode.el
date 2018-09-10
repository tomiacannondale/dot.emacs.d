(require 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
(add-hook 'sgml-mode-hook 'emmet-mode)
