;;======================================================================
;; emacsを隔離した条件で起動する時の設定
;; 隔離したい時、この設定を書いたinit.elを作って
;;    emacs -q -l ~/path/to/somewhere/init.el
;;======================================================================
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

;; emacsで30分何もしなかったら全てのバッファを保存
;; http://d.hatena.ne.jp/authorNari/20110204/1296809004
(run-with-idle-timer 1800 t 'save-current-configuration)

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

;; recentfで保存するファイル数
(setq recentf-max-saved-items 1000)

;; バッファの再読み込み
;; http://blog.shibayu36.org/entry/2012/12/29/001418
(global-auto-revert-mode 1)

;; カーソルを点滅しつづける(これないとカーソルが消えちゃう Emacs24から)
(setq blink-cursor-blinks 0)

;; インデントにtabを使わない
(setq-default indent-tabs-mode nil)
;;;========================================================
;;; 検索系のkeybind
;;;========================================================
(define-prefix-command 'my-search-map)
(define-key global-map (kbd "\C-cs") 'my-search-map)
(define-prefix-command 'my-search-map)

;;========================================================
;; るりまサーチをemacsから検索する
;; http://d.hatena.ne.jp/a666666/20110721/1311262558
;; のコメント欄
;;========================================================
(defun rurema-search ()
  "るりまサーチを検索する"
  (interactive)
  (let ((word (read-from-minibuffer "rurema search: ")))
    (setq word (url-encode-url word))
    (setq word (replace-regexp-in-string "#" "%23" word))
    (browse-url (format "http://rurema.clear-code.com/query:%s/" word))))

(define-key my-search-map (kbd "r") 'rurema-search)

;;========================================================
;; unixの部屋でunixコマンドをemacsから検索する
;; http://d.hatena.ne.jp/a666666/20110721/1311262558
;; のコメント欄から応用
;;========================================================
(defun man-search ()
  "unixコマンドを検索する"
  (interactive)
  (let ((word (read-from-minibuffer "man search: ")))
    (setq word (url-encode-url word))
    (browse-url (format "http://x68000.q-e-d.net/~68user/unix/pickup?keyword=%s&target=command" word))))

(define-key my-search-map (kbd "m") 'man-search)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;========================================================
 ;; ediffのコントロールパネルを別frameにしない
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))

 ;;========================================================
 ;; 'encoding: utf-8'というshebungを有効にする
 ;;========================================================
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

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

(setq recentf-save-file (expand-file-name "~/.recentf"))
