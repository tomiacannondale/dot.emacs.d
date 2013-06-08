(require 'helm-rails-loaddefs)

;; turnipのspecを追加する
(helm-rails-def-resource 'acceptance "spec/acceptance/" "^spec/acceptance/(.+)$")
