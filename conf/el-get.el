;===================================================================
; el-get設定
;===================================================================
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

; 自分用のレシピパスを追加する
(setq el-get-recipe-path (cons "~/.emacs.d/el-get-my-recipes" el-get-recipe-path))

; el-getのinfoより
; 指定されたライブラリがインストールされていない場合Emacsの起動時にインストールする
(setq my-packages
      (append
       '(
	 init-loader
	 emacs-w3m-info-ja
	 helm
	 ruby-mode
	 ruby-electric
	 ruby-end
	 inf-ruby
	 rbenv
	 rinari
	 rhtml-mode
	 rspec-mode
	 feature-mode
	 haml-mode
	 slim-mode
	 sass-mode
	 coffee-mode
	 markdown-mode
	 auto-complete
	 yasnippet
	 color-moccur
	 graphviz-dot-mode
	 moccur-edit
	 org-mode
	 migemo
	 dsvn
	 magit
	 wanderlust-info-ja
	 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
