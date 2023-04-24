;;========================================================
;; haml-mode設定
;; git clone https://github.com/nex3/haml-mode.git
;;========================================================
(require 'haml-mode)
(add-hook 'haml-mode-hook
  #'(lambda ()
     (setq indent-tabs-mode nil)))
