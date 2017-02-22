(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/im/theme")

;; set syntax highlight on
(global-font-lock-mode 1)

;; end theme
;;;; basic Look
;; customize linum
(global-linum-mode 1)
;; (setq linum-format "%4d \u2502")
(setq linum-format "%4d  ")
(require 'linum-off)

(require 'hlinum)
(hlinum-activate)
;;(global-visual-line-mode t)
;;cursor
(setq-default cursor-type 'bar)
(set-cursor-color "#bb4444")
;; highlight cursor line
(global-hl-line-mode 1)


;; yascroll
;; (require 'cl) ;; build-in librairie
;; (add-to-list 'load-path "~/.emacs.d/vendor/yascroll-el")
;; (require 'yascroll)
;; TODO: move these colors to theme-specific file
;; (set-face-attribute 'yascroll:thumb-fringe t :background "red" :foreground "red")
;; (set-face-attribute 'yascroll:thumb-text-area t :background "brightred")
;; (set-face-attribute 'yascroll:delay-to-hide 1000)

;; (global-yascroll-bar-mode 1)
;; end basic look

;; powerline


;; theme
(require 'my-moe-theme)
;; (require 'my-brogrammer-theme)

(provide 'init-looks)
