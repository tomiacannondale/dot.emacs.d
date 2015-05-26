(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; インデントを調整
;; http://d.hatena.ne.jp/hiratara/20090211/1234335014
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 2
                   tab-width        2
                   js2-cleanup-whitespace nil)))
