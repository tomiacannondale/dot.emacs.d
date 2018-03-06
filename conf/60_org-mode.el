;;========================================================
;;org-mode設定
;;http://hpcgi1.nifty.com/spen/index.cgi?OrgMode
;;========================================================
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/org-mode/lisp/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/el-get/org-mode/contrib/lisp") t)
(require 'org-loaddefs)

;; グローバルなキーバインド設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-font-lock)

;; todoがclosedとなった場合、日付を入力
(setq org-log-done t)

;; orgディレクトリの設定
(setq org-directory "~/Dropbox/org")

;; CLOCK行を「:LOGBOOK:」に格納する
(setq org-clock-into-drawer t)

;; -State行を「:LOGBOOK:」に格納する
(setq org-log-into-drawer t)

;; todoのキーワード設定
(setq org-todo-keywords
 '((sequence "TODO(t)" "WAITING(w)" "SOMEDAY(s)" "|" "DONE(d)" "CANCELED(c)")))

;; org-modeマニュアルより
(defun org-summary-todo (n-done n-not-done)
  "すべてのサブツリーが終了するとDONEに切り替え、その他の場合は、TODOにする。"
  (let (org-log-done org-log-states)   ; 記録「logging」を終了
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; 日時の曜日は英語表記
(add-hook 'org-mode-hook
          (lambda ()
            (set (make-local-variable 'system-time-locale) "C")))

;; agenda対象ファイルの指定
(setq org-agenda-files (list
			"~/Dropbox/org/task.org"
			"~/Dropbox/org/project.org"
			)
      )


;; org-search-viewで対象とするファイルの指定
(setq org-agenda-text-search-extra-files
      (list
       "~/Dropbox/org/link.org"
       "~/Dropbox/org/memo.org"
       "~/Dropbox/org/shops.org"
       )
      )

;; org-refileの送り先を指定
(setq org-refile-targets '((org-agenda-files :level . 1)
			   (org-agenda-text-search-extra-files :level . 1)))

;;========================================================
;; org-capture設定
;; http://d.hatena.ne.jp/rubikitch/20100819/org
;;========================================================
(global-set-key "\C-cc" 'org-capture)
;; テンプレートの指定
(setq org-capture-templates
      '(
	("m" "Memo" entry
	(file+headline "memo.org" "Memos")
	"* %?	:memo:\n  %u")
       ("t" "Todo" entry
	(file+headline "task.org" "Tasks")
	"* TODO %? %^G\n  %u")
       ("l" "Link" entry
	(file+headline "link.org" "Links")
	"* [[%c][%?	:link:\n  %u")
	)
      )

;;========================================================
;; mobile-org設定
;; http://mobileorg.ncogni.to/doc/getting-started/using-dropbox/
;; http://skalldan.wordpress.com/2011/08/18/iphone-%E3%81%A7-org-capture/
;;========================================================
;; Set to the location of your Org files on your local system
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/iphone.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/アプリ/MobileOrg")

(setq org-mobile-files
      (list (expand-file-name "~/Dropbox/org/memo.org")
            (expand-file-name "~/Dropbox/org/task.org")
            (expand-file-name "~/Dropbox/org/project.org")
            (expand-file-name "~/Dropbox/org/link.org")
            (expand-file-name "~/Dropbox/org/shops.org")
            (expand-file-name "~/Dropbox/org/iphone.org")
            ))

;;========================================================
;; org-latexでpdflatexとdvipdfmxを使う
;; http://qiita.com/tnoda_/items/6eb4d8d799e41ef3f15d
;;========================================================
(require 'ob-latex)
(setq org-latex-pdf-process '("platex %b" "platex %b" "dvipdfmx %b"))

;;========================================================
;; hook
;;========================================================
(add-hook 'org-mode-hook
          ;; org-time-stamp-inactiveのkeybindがflycheckに横取りされちゃう
          '(lambda () (flycheck-mode -1)))

