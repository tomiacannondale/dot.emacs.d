;===================================================================
; el-get設定
;===================================================================
(add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

;; elpaのレシピが存在しない場合ダウンロードする
(el-get-elpa-build-local-recipes)

;; el-getでのgithubのurlタイプを変更する
(setq el-get-github-default-url-type "https")

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
         yasnippet-snippets
	 color-moccur
	 graphviz-dot-mode
	 moccur-edit
	 migemo
	 dsvn
	 magit
	 rd-mode
	 edit-server
	 id-manager
	 yaml-mode
	 japanese-holidays
	 anzu
	 puppet-mode
	 flycheck
	 less-css-mode
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
         ox-qmd
         pt
         bundler
         shackle
         auto-save-buffers
         mic-paren-github
         wgrep
         search-web
         crontab-mode
         dockerfile-mode
         guide-key
         helm-c-yasnippet
         add-node-modules-path
         prettier-js
         ddskk
         rainbow-mode
         python-mode
         highlight-indentation-guides
         typescript-mode
         editorconfig
         web-mode
         string-inflection
         avy
	 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
