;;======================================================================
;; emacsを隔離した条件で起動する時の設定
;; 隔離したい時、この設定を書いたinit.elを作って
;;    emacs -q -l ~/path/to/somewhere/init.el
;;======================================================================

;; ;; Added by Package.el.  This must come before configurations of
;; ;; installed packages.  Don't delete this line.  If you don't want it,
;; ;; just comment it out by adding a semicolon to the start of the line.
;; ;; You may delete these explanatory comments.
;; (package-initialize)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;======================================================================
;; 言語・文字コード関連の設定
;;======================================================================
(set-language-environment 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)

;;=======================================================================
;; ロードパスの設定
;;=======================================================================
(let ((el-get-path (expand-file-name "~/.emacs.d/el-get"))
      (elisp-path (expand-file-name "~/.emacs.d/elisp")))
      (if (file-exists-p el-get-path)
          (with-temp-buffer
            (cd el-get-path)
            (normal-top-level-add-subdirs-to-load-path)))
      (if (file-exists-p elisp-path)
          (with-temp-buffer
            (cd elisp-path)
            (normal-top-level-add-subdirs-to-load-path))))

;; 環境変数をshellから取得
;; https://github.com/purcell/exec-path-from-shell
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;;=======================================================================
;; infoディレクトリの設定
;;=======================================================================
(require 'info)
(add-to-list 'Info-additional-directory-list "~/.emacs.d/etc/info")
(add-to-list 'Info-additional-directory-list "~/.emacs.d/el-get/el-get")

;;=======================================================================
;; Misc
;;=======================================================================
(mouse-wheel-mode)                              ;;ホイールマウス
(global-set-key [mouse-4] 'scroll-down)         ;;ホイールマウスでup
(global-set-key [mouse-5] 'scroll-up)           ;;ホイールマウスでdown
(global-font-lock-mode t)                       ;;文字の色つけ
(setq line-number-mode t)                       ;;カーソルのある行番号を表示
(column-number-mode t)                          ;;カーソルのあるカラム数を表示
(auto-compression-mode t)                       ;;日本語infoの文字化け防止
(set-scroll-bar-mode 'right)                    ;;スクロールバーを右に表示
;(global-set-key "\C-z" 'undo)                  ;;UNDO
(setq frame-title-format                        ;;フレームのタイトル指定
      (concat "%b - emacs@" system-name))

;; 日付（曜日）時刻を表示
(setq display-time-string-forms
 '((format "%s/%s(%s)%s:%s"
                 month day dayname
                 24-hours minutes)))
(display-time)

(global-set-key "\C-h" 'backward-delete-char)	;;Ctrl-Hでバックスペース
(setq make-backup-files nil)                    ;;バックアップファイルを作成しない
(setq visible-bell t)                           ;;警告音を消す
(setq ring-bell-function 'ignore)               ;;画面フラッシュを消す
;(setq kill-whole-line t)                        ;;カーソルが行頭にある場合も行全体を削除
;(when (boundp 'show-trailing-whitespace) (setq-default show-trailing-whitespace t))    ;;行末のスペースを強調表示

(setq truncate-partial-width-windows nil)      ;;縦分割したときも行を折り返し

;; ファイル名が重複していたらディレクトリ名を追加する。
;; http://www.clear-code.com/blog/2011/2/16.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; ツールバーを消去
;; http://www.clear-code.com/blog/2011/2/16.html
(tool-bar-mode -1)

;; 補完時大文字小文字を区別しない
;; http://www.clear-code.com/blog/2011/2/16.html
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; 対応する括弧を光らせる
(show-paren-mode 1)
(setq who-paren-style 'mixed)

;; kill-ringに同じ内容の文字列を複数入れない
;; http://www.fan.gr.jp/~ring/Meadow/meadow.html#ys:trim-whitespaces
(defadvice kill-new (before ys:no-kill-new-duplicates activate)
  (setq kill-ring (delete (ad-get-arg 0) kill-ring)))

;; emacs終了時にプロセスが起動中でも問い合わせ無しに終了する
;; http://d.hatena.ne.jp/kitokitoki/20101029/p3
(defadvice save-buffers-kill-terminal (before my-save-buffers-kill-terminal activate)
  (when (process-list)
    (dolist (p (process-list))
      (set-process-query-on-exit-flag p nil))))

;; recentf
(recentf-mode 1)
(setq recentf-max-saved-items 1000)
(setq recentf-save-file (expand-file-name "~/.recentf"))

;; バッファの再読み込み
;; http://blog.shibayu36.org/entry/2012/12/29/001418
(global-auto-revert-mode 1)

;; カーソルを点滅しつづける(これないとカーソルが消えちゃう Emacs24から)
(setq blink-cursor-blinks 0)

;; インデントにtabを使わない
(setq-default indent-tabs-mode nil)

;; window間の移動(shift + 矢印で移動可能)
(windmove-default-keybindings)

;; カーソル移動無しで1行だけスクロール
;; http://d.hatena.ne.jp/uhiaha888/20101110/1289399913
(global-set-key "\M-n" (lambda () (interactive) (scroll-up 1)))
(global-set-key "\M-p" (lambda () (interactive) (scroll-down 1)))

;;;========================================================
;;; 検索系のkeybind
;;;========================================================
(define-prefix-command 'my-search-map)
(define-key global-map (kbd "\C-cs") 'my-search-map)
(define-prefix-command 'my-search-map)

;;; 拡張elispの設定

;; rbenvのインストールの前(el-getのload前)に
;; rbenv-installation-dir を設定する
(load "~/.emacs.d/conf/80_rbenv.el")

;;=======================================================================
;; el-getの呼び出し
;; init-loaderより先に呼ばないとクリーンインストールする時
;; el-get syncがうまく動かない
;;=======================================================================
(load "~/.emacs.d/conf/el-get.el")

;;=======================================================================
;; init-loader設定
;; cd ~/.emacs.d/elisp
;; git clone git://github.com/emacs-jp/init-loader.git
;;=======================================================================
;; (add-to-list 'load-path "~/.emacs.d/el-get/init-loader")
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf/")
(if (file-exists-p "~/.emacs.d/conf/local/")
    (init-loader-load "~/.emacs.d/conf/local/"))

;;;========================================================
;;; emacsclientを起動できるようにする
;;;========================================================
(server-start)

;; grep系のキーバインド
(define-prefix-command 'my-grep-map)
(define-key global-map (kbd "\C-cg") 'my-grep-map)
(define-prefix-command 'my-grep-map)

(define-key my-grep-map (kbd "p") 'pt-regexp)
(define-key my-grep-map (kbd "m") 'moccur-grep-find)

;; https://emacs.stackexchange.com/questions/74289/emacs-28-2-error-in-macos-ventura-image-type-invalid-image-type-svg
;; ewwを使うと  "image-type: Invalid image type `svg`" となる
(add-to-list 'image-types 'svg)
