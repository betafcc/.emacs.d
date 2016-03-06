

(setq linum-format "%4d ")
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
(scroll-bar-mode -1)
(blink-cursor-mode 0)
(set-face-attribute 'linum nil :background "#2a2a2a" :foreground "white")
(tabbar-mode 1)
(provide 'init-gui)
