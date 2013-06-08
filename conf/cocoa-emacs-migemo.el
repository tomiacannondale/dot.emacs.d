;;========================================================
;; migemo設定
;; brew install cmigemo
;; http://0xcc.net/migemo/  (migemoホーム)
;; https://gist.github.com/457761 (migemo.el公開gist)
;;========================================================
(load "migemo")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs" "-i" "\a"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)

;;;========================================================
;;; moccurでmigemoを使う
;;; http://www.bookshelf.jp/soft/meadow_50.html
;;;========================================================
(setq moccur-use-migemo t)

;; Emacs24.3でカーソルが移動しない対処
;; http://qiita.com/items/bda92200f4a48ca89228
(setq search-whitespace-regexp nil)
