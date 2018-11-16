(defun sane-tab-tab-command (number-of-levels)
  (interactive "p")
  ;; if there is no region and on bol, do insert indent
  (if (and (= (point) (line-beginning-position))
           (not (and (mark) (use-region-p))))
      (sane-tab-insert-indent number-of-levels)
    (call-interactively (function sane-tab-indent-line-or-region))))


(defun sane-tab-dedent-line-or-region (first-line until-relative-line number-of-levels)
  (interactive (sane-tab--interactive-helper))
  (sane-tab--helper
   (function sane-tab-remove-indent)
   first-line until-relative-line number-of-levels))


(defun sane-tab-indent-line-or-region (first-line until-relative-line number-of-levels)
  (interactive (sane-tab--interactive-helper))
  (sane-tab--helper
   (function sane-tab-insert-indent-if-not-empty-line)
   first-line until-relative-line number-of-levels))


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


(defun sane-tab--helper (indent-function first-line until-relative-line number-of-levels)
  (save-excursion
    ;; goto the beginning of lower-numbered line in region
    (if (> until-relative-line 0)
        (goto-char (line-beginning-position))
      (forward-line until-relative-line)
      (setq until-relative-line (- until-relative-line)))

    (funcall indent-function number-of-levels)
    (while (> until-relative-line 0)
      (forward-line)
      (funcall indent-function number-of-levels)
      (setq until-relative-line (1- until-relative-line))))

  (setq deactivate-mark nil))


(defun sane-tab--interactive-helper ()
  (let* ((first-line (line-number-at-pos (point)))
         (until-relative-line (if (and (mark) (use-region-p))
                                  (- (line-number-at-pos (mark)) first-line)
                                0))
         (number-of-levels (or current-prefix-arg 1)))

    (list first-line until-relative-line number-of-levels)))


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


;; https://emacs.stackexchange.com/questions/16792
(defun sane-tab-line-blank-p (&optional n)
  (interactive)
  (save-excursion
    (if n (goto-line n))
    (beginning-of-line)
    (looking-at-p "[[:space:]]*$")))


(provide 'sane-tab)
