;;========================================================
;;org-mode設定
;;http://hpcgi1.nifty.com/spen/index.cgi?OrgMode
;;========================================================

;; カレンダーで日付の移動keyを可能にする(shift-<cursol>)
;; org-mode infoより
;; `S-<UP>` -> `M-p`              `S-<DOWN>` -> `M-n`
;; `S-<LEFT>` -> `M--`            `S-<RIGHT>` -> `M-+`
;; `C-S-<LEFT>` -> `M-S--`        `C-S-<RIGHT>` -> `M-S-+`
(setq org-replace-disputed-keys t)

(require 'org-loaddefs)
(require 'org-agenda)
(require 'org-capture)


;; グローバルなキーバインド設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

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
			"~/Dropbox/org/inbox.org"
			)
      )


;; org-search-viewで対象とするファイルの指定
(setq org-agenda-text-search-extra-files
      (list
       "~/Dropbox/org/link.org"
       "~/Dropbox/org/memo.org"
       "~/Dropbox/org/shops.org"
       "~/Dropbox/org/inbox.org"
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
       ("c" "Code Readings" entry
        (file+headline "code-reading.org" "Code Readings")
        "** %? %^g\n   %u\n   %a")
       ("i" "Inbox" entry
        (file+headline "inbox.org" "Inbox")
        "** %?\n   %u\n")
       )
      )

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
          #'(lambda () (flycheck-mode -1)))


(with-eval-after-load 'org
  ;; <s<TAB>とかでブロックテンプレート(structure template)を使う
  (require 'org-tempo))
