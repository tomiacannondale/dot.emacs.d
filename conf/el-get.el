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

;; el-getでのgithubのurlタイプを変更する
(setq el-get-github-default-url-type "https")

;; elpaのレシピが存在しない場合ダウンロードする
;; (el-get-elpa-build-local-recipes)

; 自分用のレシピパスを追加する
(setq el-get-recipe-path (cons "~/.emacs.d/el-get-my-recipes" el-get-recipe-path))

; el-getのinfoより
; 指定されたライブラリがインストールされていない場合Emacsの起動時にインストールする
(setq my-packages
      (append
       '(
	 init-loader
	 helm
	 ruby-mode
	 ruby-electric
	 ruby-end
	 inf-ruby
	 rbenv
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
	 qiita-el
	 rd-mode
	 edit-server
	 id-manager
	 yaml-mode
	 helm-migemo
	 dropdown-list
	 japanese-holidays
	 anzu
	 puppet-mode
	 flycheck
	 less-css-mode
	 haskell-mode
	 helm-ls-git
	 helm-ls-git-find-file
	 google-translate
	 codic
	 ace-jump-mode
	 expand-region
	 multiple-cursors
	 js2-mode
	 emmet-mode
	 smartrep
	 ace-isearch
         ox-qmd
         pt
	 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
