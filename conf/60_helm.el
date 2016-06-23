(require 'helm-config)

(global-set-key "\M-y" 'helm-show-kill-ring)
(global-set-key "\C-xb" 'helm-buffers-list)
(global-set-key "\M-x" 'helm-M-x)
(global-set-key "\M-gm" 'helm-all-mark-rings)

(eval-after-load "helm"
  '(progn
     ;; helmの選択画面でC-hを有効に
     ;; https://github.com/emacs-jp/emacs-jp.github.com/issues/47
     (define-key helm-map (kbd "C-h") 'delete-backward-char)

     ;; 自動補完を無効
     (custom-set-variables '(helm-ff-auto-update-initial-value nil))

     ;; isearch時にヒットした箇所をhelmで表示する
     ;; http://shibayu36.hatenablog.com/entry/2013/12/30/190354
     (define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)

     ;; helm-migemo
     (helm-migemo-mode 1)
     ))

(eval-after-load "helm-files"
  '(progn
     ;; TABで任意補完。選択肢が出てきたらC-nやC-pで上下移動してから決定することも可能
     ;; https://github.com/emacs-jp/emacs-jp.github.com/issues/47
     (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
     ;; helm-find-fileで絶対パスを表示
     (setq helm-ff-transformer-show-only-basename nil)))
