(require 'search-web)
(setq search-web-in-emacs-browser 'eww-browse-url)
(setq search-web-engines
      (append
       '(
         ("ruby" "http://rurema.clear-code.com/?query=%s" In-Emacs)
         ("unix man" "http://x68000.q-e-d.net/~68user/unix/pickup?keyword=%s&target=command" In-Emacs)
         ("hoogle" "http://haskell.org/hoogle/?hoogle=%s" In-Emacs)
         ) search-web-engines))

(defadvice eww-render (around eww-display-html activate)
  (save-window-excursion ad-do-it)
  (unless (get-buffer-window "*eww*")
    (pop-to-buffer "*eww*")))

(defun my-search-web (args prompt engine)
  "Basic function about my-xxx-search-web.
ARGS is prefix arguments.
If ARGS is defined, ask what do search with, search by `search-web'.
If ARGS is not defined, search accoding to the following 3 patterns.

* Region is active, search by `search-web-region'.
* Word at point, search by `search-web-at-point'.
* Do not apply to the 2 above, Ask about search word and search by `search-web'.

PROMPT is a string to search for.
ENGINE is a search engine. It should be one of `search-web-engines'."
  (if (equal 0 (% args 4))
      (let ((word (read-from-minibuffer prompt)))
        (search-web engine word))
    (cond
     ((region-active-p)
      (search-web-region engine))
     ((thing-at-point 'word)
      (search-web-at-point engine))
     (t
      (let ((word (read-from-minibuffer prompt)))
        (search-web engine word))))))

(define-key my-search-map (kbd "m")
  (lambda (args)
    (interactive "p")
    (my-search-web args "Man Search: " "unix man")))

(define-key my-search-map (kbd "r")
  (lambda (args)
    (interactive "p")
    (my-search-web args "Rurema Search: " "ruby")))

(define-key my-search-map (kbd "g")
  (lambda ()
    (interactive)
    (my-search-web 4 "Google Search: " "google")))

(define-key my-search-map (kbd "h")
  (lambda (args)
    (interactive "p")
    (my-search-web args "Hoogle Search: " "hoogle")))
