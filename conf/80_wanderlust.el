;;====================================================
;; wanderlust設定
;;====================================================
(require 'mime-w3m)
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

(setq wl-icon-directory (expand-file-name "~/.emacs.d/el-get/wanderlust-info-ja/icons"))
