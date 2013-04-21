;;========================================================
;; javascript-mode設定
;; auto-install from url RET http://www.karllandstrom.se/downloads/emacs/javascript.el
;;========================================================
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
