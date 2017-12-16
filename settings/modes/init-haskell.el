(require 'company)

(add-to-list 'company-backends 'company-ghc)

(setq haskell-process-type 'stack-ghci)
(setq company-ghc-show-info t)
(setq ghc-report-errors nil)


(define-key haskell-mode-map [f8] 'haskell-navigate-imports)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
(define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-h") 'haskell-hoogle)

(define-key haskell-mode-map (kbd "RET") 'electric-newline-and-maybe-indent)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook #'hindent-mode)

(provide 'init-haskell)
