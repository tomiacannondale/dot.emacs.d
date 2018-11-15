(defun my-add-eslint-to-flycheck ()
  (flycheck-add-mode 'javascript-eslint 'vue-mode)
  (flycheck-add-mode 'javascript-eslint 'vue-html-mode)
  (flycheck-add-mode 'javascript-eslint 'css-mode))

(eval-after-load 'vue-mode
  '(progn
     (add-hook 'vue-mode-hook #'add-node-modules-path)
  ))

(eval-after-load 'flycheck
  '(my-add-eslint-to-flycheck))
