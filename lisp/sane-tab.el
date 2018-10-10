;;
;; note about goto-line:
;; https://stackoverflow.com/questions/11805572/why-is-goto-line-in-emacs-for-interactive-use-only

;; tab -> sane-tab-insert-indent-string-or-indent-region
;; backtab -> sane-tab-dedent-line-or-region
(defun sane-tab-insert-indent-string-or-indent-region ()
  (interactive)
  (if (use-region-p)
      (sane-tab-indent-region (region-beginning) (region-end))
    (insert (sane-tab-indent-string))))


(defun sane-tab-dedent-line-or-region ()
  (interactive)
  (if (use-region-p)
      (sane-tab-dedent-region (region-beginning) (region-end))
    (sane-tab-dedent-line)))


(defun sane-tab-indent-region (start end)
  (interactive "r")
  (mapc
   'sane-tab-indent-line-if-not-empty
   (sane-tab-region-lines start end))
  (setq deactivate-mark nil))


(defun sane-tab-dedent-region (start end)
  (interactive "r")
  (mapc
   'sane-tab-dedent-line
   (sane-tab-region-lines start end))
  (setq deactivate-mark nil))


(defun sane-tab-indent-line-if-not-empty (&optional n)
  (interactive)
  (unless (sane-tab-line-empty-p n)
      (sane-tab-indent-line n)))


(defun sane-tab-indent-line (&optional n)
  (interactive)
  (save-excursion
    (if n
        (goto-line n)
    (goto-char (line-beginning-position)))
    (insert (sane-tab-indent-string))))


(defun sane-tab-region-lines (start end)
  (interactive "r")
  (number-sequence
   (line-number-at-pos start)
   (line-number-at-pos end)))


(defun sane-tab-indent-string ()
  (if indent-tabs-mode
      "	" ;; a tab
    (make-string tab-width ? )))


(defun sane-tab-dedent-line (&optional n)
  (interactive)
  (save-excursion
    (if n
        (goto-line n)
      (goto-char (line-beginning-position)))

    (if indent-tabs-mode
        (sane-tab-dedent-line-tab)
      (sane-tab-dedent-line-spaces))))


(defun sane-tab-dedent-line-spaces ()
    (let ((n tab-width))
      (while (and (> n 0) (looking-at " "))
        (delete-char 1)
        (setq n (- n 1)))))


(defun sane-tab-dedent-line-tab ()
    (if (looking-at-p (char-to-string "	" ;; a tab
                                      ))
        (delete-char 1)))


(defun sane-tab-line-empty-p (&optional n)
  (interactive)
  (save-excursion
    (if n (goto-line n))
    (= (line-beginning-position)
       (line-end-position))))


;; https://emacs.stackexchange.com/questions/16792
(defun sane-tab-line-blank-p (&optional n)
  (interactive)
  (save-excursion
    (if n (goto-line n))
    (beginning-of-line)
    (looking-at-p "[[:space:]]*$")))


(provide 'sane-tab)
