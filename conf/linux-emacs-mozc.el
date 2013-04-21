;;========================================================
;; emacs-mozc設定
;;    sudo aptitude install emacs-mozc
;;========================================================
(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)
(global-set-key [henkan] 'toggle-input-method)
(global-set-key [muhenkan] 'toggle-input-method)
