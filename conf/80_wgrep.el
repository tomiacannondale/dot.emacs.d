(with-eval-after-load 'wgrep
  (setq wgrep-enable-key "r")
  )
(add-hook 'pt-search-mode-hook 'wgrep-pt-setup)
