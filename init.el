(add-to-list 'load-path "~/.emacs.d/vendor/benchmark-init-el")
(require 'benchmark-init-loaddefs)
(benchmark-init/activate)


(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
             t)
(package-initialize)


(add-to-list 'load-path "~/.emacs.d/im")

;; basic hides, compatibilities handles
(require 'init-resets)
;; visual settings, theme liking, powerline
(require 'init-looks)
;; keybindgs, autocompletes, popups, minimap, tabs
(require 'init-feel)

;; TODO: decide loading order
(when (display-graphic-p)
  (require 'init-gui)
)		 


(eval-after-load 'haskell-mode '(require 'init-haskell))
(eval-after-load 'racket-mode '(require 'init-racket))


(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(package-selected-packages
   (quote
    (hlinum undo-tree tabbar-ruler smartparens smart-mode-line-powerline-theme racket-mode neotree multiple-cursors hindent helm expand-region company-ghci company-ghc))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
