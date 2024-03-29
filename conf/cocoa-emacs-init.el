;=======================================================================
;; フォント設定
;=======================================================================
(set-face-attribute 'default nil :family "Ricty Diminished" :height 185)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty Diminished"))
;; http://d.hatena.ne.jp/setoryohei/20110117/1295336454
(set-fontset-font nil 'japanese-jisx0213.2004-1 (font-spec :family "Ricty Diminished")) ; 日本語の表示
(set-fontset-font nil 'japanese-jisx0213-2 (font-spec :family "Ricty Diminished"))  ; 日本語の表示
(set-fontset-font nil 'katakana-jisx0201 (font-spec :family "Ricty Diminished")) ; 半角カナ
(set-fontset-font nil '(#x0080 . #x024F) (font-spec :family "Ricty Diminished")) ; 分音符付きラテン
(set-fontset-font nil '(#x0370 . #x03FF) (font-spec :family "Ricty Diminished")) ; ギリシャ文字

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
       '(height . 40)                      ;; フレームの高さ
       '(top . 0)                          ;; Y 表示位置
       '(left . 0)                       ;; X 表示位置
       )
    initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

(set-frame-parameter nil 'alpha 80)        ;;透明度の設定

;=======================================================================
; Misc
;=======================================================================
;; commandとmetaキーを変更
;; http://macemacsjp.sourceforge.jp/index.php?CocoaEmacs
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; indent-regionのキーバインド(macでは\がうまくきかない)
(global-set-key (kbd "C-M-¥") 'indent-region)


;; ドラックドロップでをファイルを開く
;; http://macemacsjp.sourceforge.jp/index.php?CocoaEmacs#tc915aeb
(define-key global-map [ns-drag-file] 'ns-find-file)

;; toggle-truncate-linesにキーバインドを設定する
;; recenter-top-bottomのキーバインドを上書き
(global-set-key "\C-l" 'toggle-truncate-lines)

;; emacsからウィズダムとかジーニアス大辞典を引く
;; https://gist.github.com/skoji/936a89f5e1e7c6f93d4a216175408659
(defun monokakido-lookup (word)
  "Lookup word with Dictionaries.app by Monokakido"
  (call-process "open" nil 0 nil (concat "mkdictionaries:///?text=" word)))

(defun monokakido-lookup-word ()
  "Lookup the word at point with Dictionaries.app by Monokakido."
  (interactive)
  (monokakido-lookup (read-from-minibuffer "Monokakido: " (current-word))))

(define-key global-map (kbd "C-x C-y") 'monokakido-lookup-word)

;; 円マークをバックスラッシュに
;; https://github.com/emacs-jp/emacs-jp.github.com/issues/22
;; インラインパッチを使わないでも結構いけるので、この関数だけパッチからもらう
(defun mac-translate-from-yen-to-backslash ()
  ;; Convert yen to backslash for JIS keyboard.
  (interactive)

  (define-key global-map [165] nil)
  (define-key global-map [2213] nil)
  (define-key global-map [3420] nil)
  (define-key global-map [67109029] nil)
  (define-key global-map [67111077] nil)
  (define-key global-map [8388773] nil)
  (define-key global-map [134219941] nil)
  (define-key global-map [75497596] nil)
  (define-key global-map [201328805] nil)
  (define-key function-key-map [165] [?\\])
  (define-key function-key-map [2213] [?\\]) ;; for Intel
  (define-key function-key-map [3420] [?\\]) ;; for PowerPC
  (define-key function-key-map [67109029] [?\C-\\])
  (define-key function-key-map [67111077] [?\C-\\])
  (define-key function-key-map [8388773] [?\M-\\])
  (define-key function-key-map [134219941] [?\M-\\])
  (define-key function-key-map [75497596] [?\C-\M-\\])
  (define-key function-key-map [201328805] [?\C-\M-\\])
)
(mac-translate-from-yen-to-backslash)

;; isearchで円マーク -> バックスラッシュに変換をする
;; https://qiita.com/hirokisince1998/items/029741559d7ba7078523
(defun isearch-add-backslash()
  (interactive)
  (isearch-printing-char ?\\ 1))
(define-key isearch-mode-map [?¥] 'isearch-add-backslash)
