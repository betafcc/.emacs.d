(defun shell-command-on-region-to-string (start end command)
  (with-output-to-string
    (shell-command-on-region start end command standard-output)))

(defun shell-eval-selected (command)
  (shell-command-on-region-to-string (point) (mark) command))

(defun shell-transform-selected (command)
  (let ((output (shell-eval-selected command)))
    (delete-region (point) (mark))
    (insert output)))


(defun shell-build-current (command)
  (shell-command-to-string (format "%s %s" command (buffer-file-name))))

;; evaluates current buffer and outputs to temp buffer
(defun shell-eval-buffer (command)
  (let ((result (shell-build-current command)))
    (progn
      (with-output-to-temp-buffer (format "\n[%s]" command)
	(princ result)
	(princ standard-output))
      (other-window 1)
      (linum-mode -1)
      (shrink-window 15))))


(defun build-eval ()
  (interactive)
  (if (region-active-p)
      (shell-transform-selected build-command)
    (shell-eval-buffer build-command)))



(provide 'build)
