;;========================================================
;; applescript-mode設定
;; http://macemacsjp.sourceforge.jp/documents/applescript-mode
;;========================================================
(autoload 'applescript-mode "applescript-mode" "major mode for editing AppleScript source." t)
(setq auto-mode-alist
     (cons '("\\.applescript$" . applescript-mode) auto-mode-alist)
     )
