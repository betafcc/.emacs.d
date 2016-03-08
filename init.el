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
