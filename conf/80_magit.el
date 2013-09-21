(require 'magit)

;; diffの色を変更する
;; http://qiita.com/nishikawasasaki/items/f690ee08f6a32d9d03fa
;; 追加した部分を緑に
(set-face-foreground 'magit-diff-add "green")
;; 削除した 部分を赤に
(set-face-foreground 'magit-diff-del "red")
;; 選択項目ハイライトがうっとうしいので背景色と同化
(set-face-background 'magit-item-highlight "#000000")

;; `M-x magit-status` で選択出来るディレクトリ
(setq magit-repo-dirs '("~/.emacs.d" "~/.zsh.d" "~/code"))
