;; dired-find-alternate-fileを有効にする
;; diredの中で `a' 新しいディレクトリを開く時バッファを作らない
(put 'dired-find-alternate-file 'disabled nil)

;; ファイルなら別バッファで、ディレクトリなら同じバッファで開く
;; http://nishikawasasaki.hatenablog.com/entry/20120222/1329932699
;; Change argument of dired-get-filename(NO-ERROR-IF-NOT-FILEP)
(defun dired-open-in-accordance-with-situation ()
  (interactive)
  (let ((file (dired-get-filename nil t)))
    (if (file-directory-p file)
        (dired-find-alternate-file)
      (dired-find-file))))

;; 上記を `RET` にバインド
(define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)
;; `a` で新しいバッファで該当のディレクトリ(ファイル)を開く。
(define-key dired-mode-map (kbd "a") 'dired-find-file)

;; ディレクトリを再帰的にコピーする
(setq dired-recursive-copies 'always)

;; diredを2つのウィンドウで開いている時に、デフォルトの移動orコピー先をもう一方のdiredで開いているディレクトリにする
(setq dired-dwim-target t)
