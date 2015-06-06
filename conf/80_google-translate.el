(global-set-key "\C-ct" 'my-google-translate)

(defun my-google-translate (arg)
  "Translate with google translate."
  (interactive "p")
  (if (equal arg 4)
      (call-interactively 'google-translate-query-translate)
    (call-interactively 'google-translate-at-point)))
