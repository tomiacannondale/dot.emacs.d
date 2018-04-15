;;========================================================
;; yasnippetの設定
;; git clone git://github.com/capitaomorte/yasnippet.git
;;========================================================
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-prompt-functions '(yas-dropdown-prompt yas-x-prompt yas-completing-prompt yas-ido-prompt yas-no-prompt))

; snippet置き場を変更(自分で追加するsnippetは最初のディレクトリになる
(setq yas-snippet-dirs
      '("~/.emacs.d/etc/snippets" "~/.emacs.d/el-get/yasnippet/snippets"))

; 自分で追加したスニペットはロード時にスニペットディレクトリのロードが必要
(eval-after-load 'rspec-mode
  (yas-load-directory "~/.emacs.d/etc/snippets"))

(custom-set-faces
 '(ac-yasnippet-candidate-face ((t (:inherit ac-candidate-face))))
 '(ac-yasnippet-selection-face ((t (:inherit ac-selection-face)))))
