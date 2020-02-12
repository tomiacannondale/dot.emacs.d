(require 'skk-autoloads)

(setq default-input-method "japanese-skk")

;;; migemoの時に英数にする
(setq skk-isearch-start-mode 'latin)

;;; 送りがなをちゃんと指定しなくても変換される
(setq skk-auto-okuri-process t)

;; 辞書登録のとき、余計な送り仮名を送らないようにする
(setq skk-check-okurigana-on-touroku 'auto)

;; 変換の学習
(require 'skk-study)

(setq skk-large-jisyo
      (expand-file-name "~/.skk-get-jisyo/SKK-JISYO.L"))

(when skk-use-color-cursor
  ;; カーソル色を変えてみる
  (setq skk-cursor-hiragana-color       "blue"
	   skk-cursor-katakana-color       "green"
	   skk-cursor-abbrev-color         "red"
	   skk-cursor-jisx0208-latin-color "red"
	   skk-cursor-jisx0201-color       "purple"
	   skk-cursor-latin-color          "cyan")
  ;;
  (set-face-foreground 'skk-prefix-hiragana-face skk-cursor-hiragana-color)
  (set-face-foreground 'skk-prefix-katakana-face skk-cursor-katakana-color)
  (set-face-foreground 'skk-prefix-jisx0201-face skk-cursor-jisx0201-color))
