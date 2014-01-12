(unless (file-exists-p "~/.rbenv")
  (setq rbenv-installation-dir "/opt/boxen/rbenv"))
(if (require 'rbenv nil t)
    (global-rbenv-mode))
