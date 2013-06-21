;; helmを使えるように独自に改造
(setq load-path (cons "~/code/vendor/emacs-id-manager/" load-path))

;; インターフェースはhelmを使う(require前に書かないとうまく動かない)
(setq idm-anything-or-helm "helm")

(require 'id-manager)

;; ファイルの置き場所
(setq idm-database-file "~/Documents/.idm-db.gpg")
