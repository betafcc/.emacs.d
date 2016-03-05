(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
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
    (helm undo-tree yascroll multiple-cursors neotree company-ghc ghc hindent haskell-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; basic hides, compatibilities handles
(load "~/.emacs.d/im/resets.el")
;; visual settings, theme liking, powerline
(load "~/.emacs.d/im/looks.el")
;; keybindgs, autocompletes, popups, minimap, tabs
(load "~/.emacs.d/im/feel.el")

(when (display-graphic-p)
  (load "~/.emacs.d/im/gui_settings.el")
)

;; haskell specific
(load "~/.emacs.d/im/haskell_settings.el")
