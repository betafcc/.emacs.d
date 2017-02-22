(require 'powerline)
(powerline-default-theme)


(require 'moe-theme)

(setq moe-theme-highlight-buffer-id t)

(moe-theme-set-color 'green)

(moe-light)

;; Smartarens highlight
(set-face-attribute 'sp-pair-overlay-face nil
                    :background "#aaccff")

;; Selected region
(set-face-attribute 'region nil
                    :background "#aaffaa"
                    :foreground "black")

;; Overwrites
(set-face-attribute 'mode-line nil
                    :background "#ef2929"
                    :foreground "#ffffff")

(set-face-attribute 'minibuffer-prompt nil
                    :background "#ffafaf"
                    :foreground "#a40000")


(set 'first-section-color "#cb77ee")
(set-face-attribute 'mode-line nil
                    :background first-section-color
                    :foreground "white")

(set-face-attribute 'mode-line-buffer-id nil
                    :background first-section-color
                    :foreground "white")

(set-face-attribute 'mode-line-inactive nil
                    :background "white"
                    :foreground "white"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :background "#ff77bb"
                    :foreground "black")

(set-face-attribute 'powerline-active2 nil
                    :background "#ffdddd"
                    :foreground "#cc0000")
;;    
;;    
(set-face-attribute 'powerline-inactive1 nil
                    :background "white"
                    :foreground "white")

(set-face-attribute 'powerline-inactive2 nil
                    :background "white"
                    :foreground "white")

(provide 'my-moe-theme)
