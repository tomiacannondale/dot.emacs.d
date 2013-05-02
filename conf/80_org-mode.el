;;========================================================
;;org-mode設定
;;http://hpcgi1.nifty.com/spen/index.cgi?OrgMode
;;========================================================
(setq load-path (cons "~/.emacs.d/elisp/org-mode" load-path))
(require 'org-install)

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
			"~/Dropbox/org/office_scratch.org"
			"~/Dropbox/org/office_task.org"
			"~/Dropbox/org/office_daily.org"
			"~/Dropbox/org/office_appointment.org"
			"~/Dropbox/org/office_occasional.org"
			)
      )


;; org-search-viewで対象とするファイルの指定
(setq org-agenda-text-search-extra-files
      (list
       "~/Dropbox/org/link.org"
       "~/Dropbox/org/memo.org"
       "~/Dropbox/org/shops.org"
       "~/Dropbox/org/office_memo.org"
       "~/Dropbox/org/office_address.org"
       "~/Dropbox/org/office_account.org"
       )
      )

;; org-refileの送り先を指定
(setq org-refile-targets '((org-agenda-files :level . 1)))

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
	("s" "scratch" entry
	 (file+headline "office_scratch.org" "Memos")
	 "* %?\n  " :clock-in t :prepend t :clock-resume t)

	("o" "in office")
	("ot" "Tasks in Office" entry
	 (file+headline "office_task.org" "Office Tasks")
	 "* TODO %?\n  " :clock-in t :clock-resume t)
	("oc" "contract_sheet" entry
	 (file+headline "office_task.org" "Office Tasks")
	 "* %? :contract:\n" :clock-in t :clock-resume t)
	("oi" "Take in" entry
	 (file+headline "office_task.org" "Office Tasks")
	 (file "~/Dropbox/org/capture-templates/take-in.org") :clock-in t :clock-resume t)
	("oe" "regular employee" entry
	 (file+headline "office_task.org" "Office Tasks")
	 (file "~/Dropbox/org/capture-templates/regular-employee.org") :clock-in t :clock-resume t)
	("ol" "Leave job" entry
	 (file+headline "office_task.org" "Office Tasks")
	 (file "~/Dropbox/org/capture-templates/leave-job.org") :clock-in t :clock-resume t)

	("oo" "occasionals")
	("ooc" "tiny Cash" entry
	 (file+headline "office_occasional.org" "小口現金の入出金管理をする")
	 "*** 小口現金" :clock-in t :prepend t :clock-resume t)
	("oop" "Post" entry
	 (file+headline "office_occasional.org" "郵便物を整理する")
	 "*** 郵便物整理" :clock-in t :prepend t :clock-resume t)
	)
      )