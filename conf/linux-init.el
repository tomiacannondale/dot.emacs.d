;;; マシン固有の設定
;=======================================================================
;フレームサイズ・位置・色など
;=======================================================================
(setq initial-frame-alist
     (append (list
       '(foreground-color . "white")       ;; 文字色
       '(background-color . "black")   ;; 背景色
       '(border-color . "black")
       '(mouse-color . "white")
       '(cursor-color . "white")
       '(width . 140)                       ;; フレームの幅
       '(height . 48)                      ;; フレームの高さ
       '(top . 0)                          ;; Y 表示位置
       '(left . 30)                       ;; X 表示位置
       )
    initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

;; 透明度の設定
(set-frame-parameter nil 'alpha 70)

;=======================================================================
;; フォント設定
;=======================================================================
(set-face-attribute 'default nil :family "ricty" :height 135)
(set-fontset-font nil 'japanese-jisx0213.2004-1 (font-spec :family "ricty")) ; 日本語の表示
;; http://d.hatena.ne.jp/setoryohei/20110117/1295336454
(set-fontset-font nil 'japanese-jisx0213-2 (font-spec :family "ricty"))  ; 日本語の表示
(set-fontset-font nil 'katakana-jisx0201 (font-spec :family "ricty")) ; 半角カナ
(set-fontset-font nil '(#x0080 . #x024F) (font-spec :family "ricty")) ; 分音符付きラテン
(set-fontset-font nil '(#x0370 . #x03FF) (font-spec :family "ricty")) ; ギリシャ文字

;=======================================================================
; キルリングとクリップボードの設定
;=======================================================================
(setq x-select-enable-clipboard t)

;; 拡張elispの設定
;;========================================================
;;; デフォルトのブラウザをchromeに変更する
;    http://d.hatena.ne.jp/munepi/20100221/emacs
;   インストールしているのがchromiumでなくchromeなので
;   google-chromeとchromiumの優先順位を逆にしている
;;========================================================
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program
      (if (file-exists-p "/usr/bin/google-chrome")
	  "/usr/bin/google-chrome" "/usr/bin/chromium"))

;;========================================================
;; ubuntuのps-print-buffferで文字化けしない
;; https://wiki.ubuntulinux.jp/UbuntuTips/Application/EmacsJapanesePrint
;;========================================================
(setq ps-multibyte-buffer 'non-latin-printer)
