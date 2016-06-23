(require 'shackle)
(setq shackle-rules
      '(
        ('("*Google Translate*" "*Codic Result*" "*eww*") :align below :size 0.4)
        ))
(shackle-mode 1)

;; C-zで直前のウィンドウ構成に戻す
(winner-mode 1)
(global-set-key (kbd "C-z") 'winner-undo)
