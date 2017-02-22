;; move selected lines like in sublime
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
	(exchange-point-and-mark))
    (let ((column (current-column))
	  (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (beginning-of-line)
    (when (or (> arg 0) (not (bobp)))
      (forward-line)
      (when (or (< arg 0) (not (eobp)))
	(transpose-lines arg))
      (forward-line -1)))))
(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
       arg lines down."
  (interactive "*p")
  (move-text-internal arg))
(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
       arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

;; TODO make case for unselected
(defun move-by-one (arg)
  (if (or (and (= (max (point) (mark)) (point-max)) (> arg 0))
    	  (and (= (min (point) (mark)) (point-min)) (< arg 0)))
      (message "limit reached")
    (cond
     ((and mark-active transient-mark-mode)
      (let ((change? (< (point) (mark))) (text (delete-and-extract-region (point) (mark))))
    	(forward-char arg)
    	(set-mark (point))
    	(insert text)
    	(when change? (exchange-point-and-mark))
    	(setq deactivate-mark nil))))))

(defun move-text-forward (arg)
  (interactive "*p")
  (move-by-one arg))

(defun move-text-backward (arg)
  (interactive "*p")
  (move-by-one (- arg))) 

(provide 'move-text)
