;;========================================================
;; egg設定
;; git clone https://github.com/byplayer/egg.git egg-mode
;;========================================================
(when (executable-find "git")
  (require 'egg nil t))
(define-key egg-status-buffer-mode-map "A" 'egg-stage-untracked-files)
