(require 'cl-lib)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")



(defun slime-compile-and-go ()
  (interactive)
  (if (get-buffer "*slime-repl sbcl*")
      (progn (slime-compile-and-load-file)
	     (switch-to-buffer-other-window "*slime-repl sbcl*"))
    (slime)
    (shrink-window 15)))


;; (set-local-key (kbd ("C-c C-c")) 'slime-compile-defun)


(defun slime-config ()
  (smartparens-mode -1)
  (define-key slime-mode-indirect-map (kbd "C-c C-c") 'slime-compile-and-go))

(add-hook 'slime-mode-hook 'slime-config)


(defun slime-repl-config ()
  (smartparens-mode -1)
  (define-key slime-repl-mode-map (kbd "C-l") 'slime-repl-clear-buffer))

(add-hook 'slime-repl-mode-hook 'slime-repl-config)

(provide 'init-cl)
