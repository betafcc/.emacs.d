(defun cc-style ()
  (c-set-style "linux")
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  )

(define-key c++-mode-map (kbd "C-d") 'mc/mark-next-like-this)

(add-hook 'c++-mode-hook 'cc-style)

(provide 'init-cpp)
