;;========================================================
;; markdown-mode
;;   git clone git://jblevins.org/git/markdown-mode.git
;; http://jblevins.org/projects/markdown-mode/
;;========================================================
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
	     '("\\.md" . gfm-mode))
