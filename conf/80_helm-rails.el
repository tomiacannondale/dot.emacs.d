(require 'helm-rails-loaddefs)

;; turnipのspecを追加する
(helm-rails-def-resource 'acceptances "spec/acceptance/" "^spec/acceptance/(.+)$")
(helm-rails-def-resource 'factories "spec/factories/" "^spec/factoris/(.+.rb)$")
(helm-rails-def-resource 'configrations "config/" "^config/(.+)$")

(define-key rinari-minor-mode-map "\C-c;fm" 'helm-rails-models)
(define-key rinari-minor-mode-map "\C-c;fc" 'helm-rails-controllers)
(define-key rinari-minor-mode-map "\C-c;fv" 'helm-rails-views)
(define-key rinari-minor-mode-map "\C-c;fr" 'helm-rails-specs)
(define-key rinari-minor-mode-map "\C-c;fa" 'helm-rails-acceptances)
(define-key rinari-minor-mode-map "\C-c;fh" 'helm-rails-helpers)
(define-key rinari-minor-mode-map "\C-c;fl" 'helm-rails-libs)
(define-key rinari-minor-mode-map "\C-c;fz" 'helm-rails-factories)
(define-key rinari-minor-mode-map "\C-c;fn" 'helm-rails-configrations)
(define-key rinari-minor-mode-map "\C-c;ff" 'helm-rails-all)
