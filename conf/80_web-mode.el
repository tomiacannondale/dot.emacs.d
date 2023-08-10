;;; 80_web-mode --- web-mode setting file

;;; Commentary:

;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html.erb$" . web-mode))

(defun my-web-mode-hook ()
  "Hook for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
)

(add-hook 'web-mode-hook  'my-web-mode-hook)

(provide '80_web-mode)
;;; 80_web-mode.el ends here
