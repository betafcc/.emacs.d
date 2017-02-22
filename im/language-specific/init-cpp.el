(defun my-cc-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'substatement-open 0)

  ;; Multiple Cursors
  (global-unset-key (kbd "M-<down-mouse-1>"))
  (define-key c++-mode-map (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
  (define-key c++-mode-map (kbd "C-c C-c") 'mc/edit-lines)
  (define-key c++-mode-map (kbd "C-d") 'mc/mark-next-like-this)
  (define-key c++-mode-map (kbd "C-c C-d") 'mc/mark-previous-like-this)
  (define-key c++-mode-map (kbd "C-c C-a") 'mc/mark-all-like-this)    


  )

(add-hook 'c++-mode-hook 'my-cc-mode-hook)

(provide 'init-cpp)
