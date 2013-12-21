;;========================================================
;; yasnippetの設定
;; git clone git://github.com/capitaomorte/yasnippet.git
;;========================================================
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-prompt-functions '(yas-dropdown-prompt yas-x-prompt yas-completing-prompt yas-ido-prompt yas-no-prompt))

; snippet置き場を変更(自分で追加するsnippetは最初のディレクトリになる
(setq yas-snippet-dirs
      '("~/.emacs.d/etc/snippets" "/Users/tomi/.emacs.d/el-get/yasnippet/snippets"))
