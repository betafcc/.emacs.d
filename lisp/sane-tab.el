(defun sane-tab-tab-command ()
  (interactive)
  (if (and (and (mark) (use-region-p))
           (/= (line-number-at-pos (point)) (line-number-at-pos (mark))))
      (call-interactively (function sane-tab-region-tab-command))
    (call-interactively (function sane-tab-single-line-tab-command))))


(defun sane-tab-backtab-command ()
  (interactive)
  (if (and (and (mark) (use-region-p))
           (/= (line-number-at-pos (point)) (line-number-at-pos (mark))))
      (call-interactively (function sane-tab-region-backtab-command))
    (call-interactively (function sane-tab-single-line-backtab-command))))


(defun sane-tab-single-line-tab-command (&optional number-of-levels)
  (interactive "P")
  ;; if I'm before indentation and no prefix given, just go there and return
  (if (and (not number-of-levels)
           (< (point) (sane-tab--line-first-non-whitespace)))
      (back-to-indentation)

    ;; else, put indents in bol
    (if (= (point) (line-beginning-position))
        ;; if in bol, insert and let point slide normally
        (sane-tab-insert-indent (or number-of-levels 1))
      ;; else, restore position
      (save-excursion
        (goto-char (line-beginning-position))
        (sane-tab-insert-indent (or number-of-levels 1))))

    ;; and don't lose the mark
    (setq deactivate-mark nil)))


(defun sane-tab-single-line-backtab-command (&optional number-of-levels)
  (interactive "P")
  ;; if point in (bol, first non white char or eol], and no prefix, go to bol and return
  (if (and (not number-of-levels)
           (<= (point) (sane-tab--line-first-non-whitespace))
           (> (point) (line-beginning-position))
           (/= (point) (line-end-position)))
      (goto-char (line-beginning-position))

    ;; else, remove indents in bol
    (save-excursion
      (goto-char (line-beginning-position))
      (sane-tab-remove-indent (or number-of-levels 1))))

  ;; and don't lose the mark
  (setq deactivate-mark nil))


(defun sane-tab--line-first-non-whitespace ()
  (save-excursion
    (back-to-indentation)
    (point)))


(defun sane-tab-region-tab-command (from-relative-line number-of-lines number-of-levels)
    (interactive (sane-tab--interactive-region-helper))
    (sane-tab--region-helper (function sane-tab-insert-indent-if-not-empty-line)
                             from-relative-line
                             number-of-lines
                             number-of-levels))


(defun sane-tab-region-backtab-command (from-relative-line number-of-lines number-of-levels)
    (interactive (sane-tab--interactive-region-helper))
    (sane-tab--region-helper (function sane-tab-remove-indent)
                             from-relative-line
                             number-of-lines
                             number-of-levels))


(defun sane-tab--interactive-region-helper ()
  (list
   (- (line-number-at-pos (region-beginning)) (line-number-at-pos (point)))
   (count-lines (region-beginning) (region-end))
   (or current-prefix-arg 1)))


(defun sane-tab--region-helper (indent-function from-relative-line number-of-lines number-of-levels)
  (save-excursion
    (forward-line from-relative-line)

    (while (> number-of-lines 0)
      (funcall indent-function number-of-levels)
      (forward-line)
      (setq number-of-lines (1- number-of-lines))))

  (setq deactivate-mark nil))


(defun sane-tab-insert-indent-if-not-empty-line (number-of-levels)
  (unless (= (line-beginning-position)
             (line-end-position))
    (sane-tab-insert-indent number-of-levels)))


(defun sane-tab-insert-indent (number-of-levels)
  (insert
   (if indent-tabs-mode
       (make-string number-of-levels ?	) ;; tab
     (make-string (* tab-width number-of-levels) ? ) ;; space
     )))


(defun sane-tab-remove-indent (number-of-levels)
  (if indent-tabs-mode
      (sane-tab--remove-helper "	"  ;; tab
                               number-of-levels)
    (sane-tab--remove-helper " " ;; space
                             (* number-of-levels tab-width))))


(defun sane-tab--remove-helper (s n)
  (while (and (> n 0) (looking-at s))
    (delete-char 1)
    (setq n (1- n))))


(provide 'sane-tab)
