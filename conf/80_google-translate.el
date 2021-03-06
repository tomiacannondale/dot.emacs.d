;;; http://blog.shibayu36.org/entry/2016/05/29/123342
(require 'google-translate)
(require 'google-translate-default-ui)

;; https://github.com/yuravg/.emacs.d/commit/51feb9a59b29dbe93eb7dc5058625c13d973c304
;; https://github.com/atykhonov/google-translate/issues/52
(setq google-translate-backend-method 'curl)
(defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130))

(defvar google-translate-english-chars "[:ascii:]"
  "これらの文字が含まれているときは英語とみなす")
(defun google-translate-enja-or-jaen (&optional string)
  "regionか現在位置の単語を翻訳する。C-u付きでquery指定も可能"
  (interactive)
  (setq string
        (cond ((stringp string) string)
              (current-prefix-arg
               (read-string "Google Translate: "))
              ((use-region-p)
               (buffer-substring (region-beginning) (region-end)))
              (t
               (thing-at-point 'word))))
  (let* ((asciip (string-match
                  (format "\\`[%s]+\\'" google-translate-english-chars)
                  string)))
    (run-at-time 0.1 nil 'deactivate-mark)
    (google-translate-translate
     (if asciip "en" "ja")
     (if asciip "ja" "en")
     string)))

(global-unset-key (kbd "C-M-t"))
(global-set-key (kbd "C-M-t") 'google-translate-enja-or-jaen)
