(require 'multiple-cursors)

(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  ;; 前をマーク
  '(("p"      . 'mc/mark-previous-like-this)
    ;; 次をマーク
    ("n"      . 'mc/mark-next-like-this)
    ;; 次をアンマーク
    ("u" . mc/unmark-next-like-this)
    ;; 前をアンマーク
    ("U" . mc/unmark-previous-like-this)
    ;; 次をスキップ
    ("s" . mc/skip-to-next-like-this)
    ;; 前をスキップ
    ("S" . mc/skip-to-previous-like-this)
    ;; 全てをマーク
    ("*"        . 'mc/mark-all-like-this)))
