;;; 80_docker-tramp --- docker-tramp setting file

;;; Commentary:

;;; Code:

(require 'docker-tramp)
(set-variable 'docker-tramp-use-names t)
(add-hook 'kill-emacs-hook 'tramp-recentf-cleanup-all)

(provide '80_docker-tramp)
;;; 80_docker-tramp.el ends here
