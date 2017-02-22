

(setq linum-format "%4d  ")
;;(define-fringe-bitmap 'right-curly-arrow
;;  [#b00000000
;;   #b00000000
;;   #b00000000
;;   #b00000000
;;   #b01110000
;;   #b00010000
;;   #b00010000
;;   #b00000000])
;;(define-fringe-bitmap 'left-curly-arrow
;;  [#b00000000
;;   #b00001000
;;   #b00001000
;;   #b00001110
;;   #b00000000
;;   #b00000000
;;   #b00000000
;;   #b00000000])


(blink-cursor-mode 0)
(set-face-attribute 'linum nil
		    :weight 'light
		    :background "#2a2a2a"
		    :foreground "gray75")
(set-face-attribute 'linum-highlight-face nil
		        :weight 'bold
			:background "firebrick2"
			:foreground "white")
(setq tabbar-ruler-use-mode-icons t)
(setq tabbar-ruler-fancy-tab-separator 'round)
(setq tabbar-ruler-style 'firefox)
(require 'tabbar-ruler)
(set-face-attribute 'mode-line nil :background "#2a2a2a")
(set-face-attribute 'mode-line-inactive nil :background "#444444")

;; TODO fix tabbar color
;;(require 'tabbar)
;;(tabbar-mode 1)

;;(setq tabbar-ruler-global-tabbar t) ; If you want tabbar
  ;;(setq tabbar-ruler-fancy-tab-separator 'line)
(provide 'init-gui)
