(require 'helm-rails-loaddefs)

;; turnipのspecを追加する
(helm-rails-def-resource 'acceptances "spec/acceptance/" "^spec/acceptance/(.+)$")
(helm-rails-def-resource 'factories "spec/factories/" "^spec/factoris/(.+.rb)$")
