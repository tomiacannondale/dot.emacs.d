;;========================================================
;; migemo設定
;; brew install cmigemo
;; http://0xcc.net/migemo/  (migemoホーム)
;; https://gist.github.com/457761 (migemo.el公開gist)
;;========================================================
(require 'migemo)
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)
(setq migemo-accept-process-output-timeout-msec 80)

;; ========================================================
;; moccurでmigemoを使う
;; http://www.bookshelf.jp/soft/meadow_50.html
;; ========================================================
(setq moccur-use-migemo t)
