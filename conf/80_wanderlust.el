;;====================================================
;; wanderlust設定
;;====================================================
(setq w3m-command "/usr/local/bin/w3m")
(require 'mime-w3m)
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

(setq wl-icon-directory (expand-file-name "~/.emacs.d/etc/wl" ))
