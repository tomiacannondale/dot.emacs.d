;;; 80_japanese-holiday --- japanese-hoilday setting file

;;; Commentary:

;;; Code:

(with-eval-after-load "calendar"
  (require 'japanese-holidays)
  (setq calendar-holidays ; 他の国の祝日も表示させたい場合は適当に調整
        (append japanese-holidays holiday-local-holidays holiday-other-holidays))
  (setq calendar-mark-holidays-flag t)	; 祝日をカレンダーに表示
  ;; 土曜日・日曜日を祝日として表示する場合、以下の設定を追加します。
  ;; デフォルトで設定済み
  (setq japanese-holiday-weekend '(0 6)	   ; 土日を祝日として表示
        japanese-holiday-weekend-marker	   ; 土曜日を水色で表示
        '(holiday nil nil nil nil nil japanese-holiday-saturday))
  (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
  (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend))

;;; 80_japanese-holiday.el ends here
