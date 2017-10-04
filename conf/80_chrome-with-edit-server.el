;;========================================================
;;chrome with edit-server設定
;; emacs_chromeのemacs部分の設定
;; git clone https://github.com/stsquad/emacs_chrome.git
;; cp emacs_chrome/server/edit-server.el ~/.emacs.d/elisp
;;========================================================
(require 'edit-server nil t)
(edit-server-start)
(setq edit-server-new-frame nil)
