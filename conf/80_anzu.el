(require 'anzu)
(global-anzu-mode +1)

(setq anzu-mode-lighter "")
(setq anzu-deactive-region t)
(setq anzu-search-treadhold 500)
(setq anzu-use-migemo t)
(setq anzu-replace-to-string-separator "=>")

(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
