(require 'brogrammer-theme)

(set-face-attribute 'linum nil
                    :background "#2a2a2a"
                    :foreground "#a5a5a5")

(set-face-attribute 'linum-highlight-face nil
                    :weight 'bold
                    :background "brightred"
                    :foreground "white")

;; more contrast for selected region
(set-face-attribute 'region nil
                    :background "#555" )

;; windows divider
;; TODO: make it thinner
(set-face-attribute 'vertical-border nil
                    :background "gray20"
                    :foreground "gray20"
                    :width 'wide)

(fringe-mode '(4 . 4))
(set-face-attribute 'fringe nil
                    :foreground "gray20"
                    :background "gray20")


(require 'powerline)
(powerline-default-theme)
;;(set-face-attribute 'mode-line nil :background "#ef2929" :foreground "#ffffff")
;; (set-face-attribute 'minibuffer-prompt nil :foreground "#a40000" :background "#ffafaf")
;;             
(set-face-attribute 'mode-line nil
                    :background "brightred"
                    :foreground "#eeeeee")

(set-face-attribute 'mode-line-buffer-id nil
                    :foreground "orange1" )

(set-face-attribute 'mode-line-inactive nil
                    :background "#333333"
                    :foreground "gray50"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :background "#333333"
                    :foreground "SpringGreen3")

(set-face-attribute 'powerline-active2 nil
                    :background "#121212"
                    :foreground "#cc0000")
;;    
;;    
(set-face-attribute 'powerline-inactive1 nil
                    :background "#606b6b"
                    :foreground "#333333")

(set-face-attribute 'powerline-inactive2 nil
                    :background "#999999"
                    :foreground "#e4e4e4")
;; These two lines are just examples
;; (setq powerline-arrow-shape 'curve)
;; (setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
;; (setq sml/theme 'powerline)
;; (sml/setup)

;; end powerline


(provide 'my-brogrammer-theme)
