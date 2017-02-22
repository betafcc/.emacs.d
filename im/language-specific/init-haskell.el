;; TODO: clean up the comapany configs workarounds

;;; haskell settings
(add-hook 'haskell-mode-hook #'hindent-mode)
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))


;;   (interactive))

(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "C-c C-l")      'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-n C-l")  'inferior-haskell-load-file)
     (define-key haskell-mode-map (kbd "C-c C-f")      'haskell-hoogle)
     (define-key haskell-mode-map (kbd "C-c C-z")      'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-n C-t")  'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-n C-i")  'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-n C-c")  'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-n c")    'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "C-c C-n l")    'hs-lint)
     (define-key haskell-mode-map (kbd "SPC")          'haskell-mode-contextual-space)))

(eval-after-load 'haskell-cabal
  '(progn
     (define-key haskell-cabal-mode-map (kbd "C-c C-z")  'haskell-interactive-switch)
     (define-key haskell-cabal-mode-map (kbd "C-c C-k")  'haskell-interactive-mode-clear)
     (define-key haskell-cabal-mode-map (kbd "C-c C-c")  'haskell-process-cabal-build)
     (define-key haskell-cabal-mode-map (kbd "C-c c")    'haskell-process-cabal)))

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))
;; (add-to-list 'load-path "~/.cabal/share/ghc-mod-5.5.0.0")

;; (autoload 'ghc-init "ghc" nil t)
;; (autoload 'ghc-debug "ghc" nil t)
;; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(defun newline-and-indent-haskell ()
  (local-set-key (kbd "RET") 'electric-newline-and-maybe-indent)
  (local-set-key (kbd "C-j") 'haskell-indentation-newline-and-indent))
(add-hook 'haskell-mode-hook 'newline-and-indent-haskell)



(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; (add-to-list 'company-backends 'company-ghc)
;; (custom-set-variables '(company-ghc-show-info t))

;; (require 'company-ghci)
;; (push 'company-ghci company-backends)
;; (add-hook 'haskell-mode-hook 'company-mode)
;; ;;To get completions in the REPL
;; (add-hook 'haskell-interactive-mode-hook 'company-mode)


(provide 'init-haskell)
