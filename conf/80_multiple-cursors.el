(require 'multiple-cursors)
;; 選択しているworkの次の部分をマーク
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; 選択しているwordの前のwordをマーク
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; 選択しているwordとマッチする全部をマーク
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
