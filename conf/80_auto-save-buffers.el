(require 'auto-save-buffers)
(setq auto-save-buffers-exclude-regexp "idm-db$\\|name.txt$")
(run-with-idle-timer 0.5 t 'auto-save-buffers)
