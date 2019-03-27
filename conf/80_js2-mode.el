(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; インデントを調整
;; http://d.hatena.ne.jp/hiratara/20090211/1234335014
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 2
                   tab-width        2
                   js2-cleanup-whitespace nil)
             (setq js2-global-externs
                   (list "jest" "describe" "it" "expect"))
             (setq js2-mode-show-parse-errors nil)
             (setq js2-mode-show-strict-warnings nil)))
(eval-after-load 'js2-mode
  '(progn
     (add-hook 'js2-mode-hook #'add-node-modules-path)
     ))
