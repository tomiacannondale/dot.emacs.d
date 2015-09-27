;;========================================================
;; rspec-mode設定
;; https://github.com/pezra/rspec-mode.git
;;========================================================
(require 'rspec-mode)

(setq rspec-use-rake-when-possible nil)

;; springコマンドをbin/springにする
(defun rspec-runner ()
  "Returns command line to run rspec"
  (let ((bundle-command (if (rspec-bundle-p) "bundle exec " ""))
        (zeus-command (if (rspec-zeus-p) "zeus " nil))
        (spring-command (if (rspec-spring-p) "bin/spring " nil)))
    (concat (or zeus-command spring-command bundle-command)
            (if (rspec-rake-p)
                (concat rspec-rake-command " spec")
              rspec-spec-command))))
