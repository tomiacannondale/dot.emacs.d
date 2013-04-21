;;========================================================
;;lookup設定
;;基本設定
;;http://www.bookshelf.jp/soft/meadow_53.html#SEC792参照
;;ジーニアス基本ファイルの設定
;;http://homepage3.nifty.com/~ynakano/
;;appendix設定
;;http://www.cymric.jp/old/mac/eblook-panther.html
;;========================================================
;; オートロードの設定
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
;; キーバインドの設定
(define-key ctl-x-map "l" 'lookup)
(define-key ctl-x-map "y" 'lookup-region)
(define-key ctl-x-map "\C-y" 'lookup-pattern)

;;起動ロゴoff
(setq lookup-enable-splash nil) 

(setq lookup-search-agents '((ndeb "~/dictionary/Genius/"
:appendix "~/dictionary/genius3-1.0")))

;;語尾補正
(setq lookup-default-dictionary-options
      '((:stemmer .  stem-english)))
