;;==================================================================
;; rhtml-mode設定
;;  git clone git://github.com/eschulte/rhtml.git
;;==================================================================
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
   (lambda () (rinari-launch)))
