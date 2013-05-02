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
	 ruby-mode
	 ruby-electric
	 ruby-end
	 rbenv
	 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
