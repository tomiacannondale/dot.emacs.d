;;========================================================
;; yasnippetの設定
;; git clone git://github.com/capitaomorte/yasnippet.git
;;========================================================
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-prompt-functions '(yas-dropdown-prompt yas-x-prompt yas-completing-prompt yas-ido-prompt yas-no-prompt))
