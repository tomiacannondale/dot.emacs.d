;;; 80_ddskk --- ddskk setting file

;;; Commentary:

;;; Code:

(require 'skk-autoloads)

(setq default-input-method "japanese-skk")

;;; migemoの時に英数にする
(setq skk-isearch-start-mode 'latin)

(setq skk-user-directory (expand-file-name "~/.emacs.d/conf/ddskk"))


(defun my-disable-skk ()
  "skkをoffにする。"
  (skk-mode -1))

;; 通常のミニバッファ
(add-hook 'minibuffer-setup-hook 'my-disable-skk)
(add-hook 'minibuffer-exit-hook 'my-disable-skk)
;; インクリメンタル検索
(add-hook 'isearch-mode-hook 'my-disable-skk)
(add-hook 'isearch-mode-end-hook 'my-disable-skk)

;;; 80_ddskk ends here
