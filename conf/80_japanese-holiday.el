;;========================================================
;; japanese-holiday設定
;; auto-install-from-url RET http://www.meadowy.org/meadow/netinstall/export/799/branches/3.00/pkginfo/japanese-holidays/japanese-holidays.el
;;========================================================
(require 'japanese-holidays)
(setq calendar-holidays
      (append japanese-holidays local-holidays other-holidays))
(setq mark-holidays-in-calendar t)

;; “きょう”をマークするには以下の設定を追加します。
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; 日曜日を赤字にする場合、以下の設定を追加します。
 (setq calendar-weekend-marker 'diary)
 (add-hook 'today-visible-calendar-hook 'calendar-mark-weekend)
 (add-hook 'today-invisible-calendar-hook 'calendar-mark-weekend)
