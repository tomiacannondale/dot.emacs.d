;;========================================================
;;anything設定
;;========================================================
(require 'anything-startup)
(setq recentf-max-saved-items 100)
(recentf-mode 1)

;; M-yでanythingヤンク
(setq anything-kill-ring-threshold 0)
(global-set-key "\M-y" 'anything-show-kill-ring)
