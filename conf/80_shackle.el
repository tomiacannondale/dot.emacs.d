(require 'shackle)
(setq shackle-rules
      '(
        ('("*Google Translate*" "*Codic Result*") :align below :ratio 0.4 :select t)
        ))
(shackle-mode 1)

;; C-zで直前のウィンドウ構成に戻す
(winner-mode 1)
(global-set-key (kbd "C-z") 'winner-undo)
