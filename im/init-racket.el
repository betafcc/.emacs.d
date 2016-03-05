(require 'smartparens-config)

(setq tab-always-indent 'complete)

(add-hook 'racket-mode-hook      #'racket-unicode-input-method-enable)
(add-hook 'racket-repl-mode-hook #'racket-unicode-input-method-enable)

(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "C-c C-l") 'racket-run)
	    (define-key racket-mode-map (kbd "C-c C-k") 'racket-profile)))

(provide 'init-racket)
