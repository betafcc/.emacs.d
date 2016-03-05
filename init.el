(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
             t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(custom-safe-themes
   (quote
    ("135bbd2e531f067ed6a25287a47e490ea5ae40b7008211c70385022dbab3ab2a" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(inhibit-startup-buffer-menu nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (racket-mode helm undo-tree yascroll multiple-cursors neotree company-ghc ghc hindent haskell-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-to-list 'load-path "~/.emacs.d/im")

;; basic hides, compatibilities handles
(require 'init-resets)
;; visual settings, theme liking, powerline
(require 'init-looks)
;; keybindgs, autocompletes, popups, minimap, tabs
(require 'init-feel)



(require 'init-haskell)
(require 'init-racket)

(when (display-graphic-p)
  (require 'init-gui)
)

(provide 'init)
