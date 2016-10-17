;; returns string cotaining the result
(defun node-build (file)
  (shell-command-to-string (format "node %s" file)))

(defun node-eval-buffer ()
  (let ((result (node-build (buffer-file-name))))
    (progn
      (with-output-to-temp-buffer "\n[node]"
	(princ result)
	(princ standard-output))
      (other-window 1)
      (linum-mode -1)
      (shrink-window 15))))

(defun shell-command-on-region-to-string (start end command)
  (with-output-to-string
    (shell-command-on-region start end command standard-output)))

(defun node-eval-region ()
  (let ((change? (< (point) (mark))))
    (when change? (exchange-point-and-mark))
    (let ((output (shell-command-on-region-to-string (point) (mark) "node")))
      (delete-region (point) (mark))
      (insert output))))

(defun node-eval ()
  (interactive)
  (if (region-active-p)
      (node-eval-region)
    (node-eval-buffer)))


(add-hook 'js2-mode-hook
	  (lambda () 
	    (define-key js2-mode-map (kbd "C-c C-l") 'node-eval)))

(provide 'init-js)
