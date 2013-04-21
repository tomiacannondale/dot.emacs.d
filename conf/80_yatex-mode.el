;;========================================================
;; yatex-mode
;;  http://www.yatex.org/
;;========================================================
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-help-file "~/.emacs.d/etc/yatex-help/YATEXHLP.jp")
(setq YaTeX-help-file-private "~/Dropbox/YATEXHLP.jp")
