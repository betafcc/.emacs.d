;; set theme before overwrites
(require 'my-moe-theme)


(require 'hlinum)
(require 'linum-off)


;; (setq-default cursor-type 'bar)

(hlinum-activate)

;; highlight cursor line
(global-hl-line-mode 1)
;; set syntax highlight on
(global-font-lock-mode 1)

(global-linum-mode 1)
(setq linum-format "%4d  ")


(provide 'init-looks)
