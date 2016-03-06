
(add-to-list 'load-path "~/.emacs.d/vendor")

;; theme
   (require 'brogrammer-theme)
;; end theme
;;;; basic Look
  ;; customize linum
    (global-linum-mode 1)
    (setq linum-format "%4d \u2502")
    (require 'linum-off)
    (set-face-attribute 'linum nil :background "#2a2a2a" :foreground "#a5a5a5")
    ;;(global-visual-line-mode t)
   ;;cursor
     (setq-default cursor-type 'bar)
     (set-cursor-color "#bb4444")
   ;; highlight cursor line
     (global-hl-line-mode 1)
   ;; more contrast for selected region
     (set-face-attribute 'region nil :background "#555" )

   (fringe-mode '(4 . 4))
   (set-face-attribute 'fringe nil
                   :foreground "gray20"
                   :background "gray20")
   ;; yascroll
     (require 'cl) ;; build-in librairie
     (add-to-list 'load-path "~/.emacs.d/vendor/yascroll-el")
     (require 'yascroll)
     ;; TODO: move these colors to theme-specific file
     (set-face-attribute 'yascroll:thumb-fringe t :background "red" :foreground "red")
     (set-face-attribute 'yascroll:thumb-text-area t :background "brightred")
     (set-face-attribute 'yascroll:delay-to-hide 1000)

     (global-yascroll-bar-mode 1)
;; end basic look

;; powerline
        (require 'powerline)
        (powerline-default-theme)
              ;;(set-face-attribute 'mode-line nil :background "#ef2929" :foreground "#ffffff")
        (set-face-attribute 'mode-line-buffer-id nil :foreground "orange1" )
        (set-face-attribute 'mode-line-inactive nil :foreground "gray50")
;; (set-face-attribute 'minibuffer-prompt nil :foreground "#a40000" :background "#ffafaf")
;;             
        (set-face-attribute 'mode-line nil :background "brightred" :foreground "#eeeeee")
        (set-face-attribute 'powerline-active1 nil :background "#333333" :foreground "SpringGreen3")
        (set-face-attribute 'powerline-active2 nil :background "#121212" :foreground "#cc0000")
;;    
;;    
        (set-face-attribute 'mode-line-inactive nil :background "#333333" :foreground "#eeeeee" :box nil)
        (set-face-attribute 'powerline-inactive1 nil :background "#606b6b" :foreground "#333333")
        (set-face-attribute 'powerline-inactive2 nil :background "#999999" :foreground "#e4e4e4")
;; These two lines are just examples
        ;;(setq powerline-arrow-shape 'curve)
        ;;(setq powerline-default-separator-dir '(right . left))
        ;; These two lines you really need.
        ;;(setq sml/theme 'powerline)
        ;;(sml/setup)

;; end powerline


(provide 'init-looks)
