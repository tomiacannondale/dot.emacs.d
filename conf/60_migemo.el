(require 'migemo)

(setq migemo-coding-system 'utf-8-unix)
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)

;; ========================================================
;; moccurでmigemoを使う
;; http://www.bookshelf.jp/soft/meadow_50.html
;; ========================================================
(setq moccur-use-migemo t)
