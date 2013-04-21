;;========================================================
;; migemo設定
;; sudo aptitude install cmigemo
;; http://0xcc.net/migemo/  (migemoホーム)
;; https://gist.github.com/457761 (migemo.el公開gist)
;;========================================================
; ubuntuで必要(http://d.hatena.ne.jp/kakurasan/20120506/p1)
(load "migemo")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs" "-i" "\a"))
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)

;;;========================================================
;;; moccurでmigemoを使う
;;; http://www.bookshelf.jp/soft/meadow_50.html
;;;========================================================
(setq moccur-use-migemo t)
