(defun comment-line-stay (arg)
  (interactive "*p")
  (save-excursion
    (comment-line arg)))

(defun bash ()
  (interactive)
  (split-window-below)
  (other-window 1)
  (shrink-window 15)
  (ansi-term "/bin/bash"))

(defun bash-here ()
  (interactive)
  (ansi-term "/bin/bash"))

(defun term-config ()
  (define-key term-raw-map (kbd "C-o") 'other-window))

(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "-scratch-"))
  (lisp-interaction-mode))


(set-register ?i (cons 'file "~/.emacs.d/init.el" ))
(set-register ?l (cons 'file "~/.emacs.d/looks/init-looks.el"   ))
(set-register ?k (cons 'file "~/.emacs.d/settings/init-basic-keymap.el"  ))


(global-set-key (kbd "C-x |") 'align-regexp)
;; comment commands
(global-set-key   (kbd "M-;")             'comment-line-stay)
(global-set-key   (kbd "C-x M-;")         'comment-dwim)
;; Tiling keys
(global-set-key   (kbd "<C-S-down>")      'shrink-window)
(global-set-key   (kbd "<C-S-up>")        'enlarge-window)
(global-set-key   (kbd "<C-S-left>")      'shrink-window-horizontally)
(global-set-key   (kbd "<C-S-right>")     'enlarge-window-horizontally)
;; Move lines
(global-set-key   (kbd "<M-up>")          'move-text-up)
(global-set-key   (kbd "<M-down>")        'move-text-down)
(global-set-key   (kbd "<M-right>")       'move-text-forward)
(global-set-key   (kbd "<M-left>")        'move-text-backward)
;; Cycle tabbar with usual Ctrl-Tab
(global-set-key   (kbd "<C-tab>")         'tabbar-forward)
(global-set-key   (kbd "<C-iso-lefttab>") 'tabbar-backward)
;; Better Buffer cycling
(global-set-key   (kbd "C-o")             'other-window)
;; force complete
(global-set-key   (kbd "C-p")             'company-complete)
;; fix terminal key redo for undo tree
(global-set-key   (kbd "M-/")             'undo-tree-redo)
;; Tree view
(global-set-key   (kbd  "C-x C-k C-b")    'neotree-toggle)
;; Multiple Cursors
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key   (kbd "M-<mouse-1>")     'mc/add-cursor-on-click)
(global-set-key   (kbd "C-c C-c")         'mc/edit-lines)
(global-set-key   (kbd "C-d")             'mc/mark-next-like-this)
(global-set-key   (kbd "C-c C-d")         'mc/mark-previous-like-this)
(global-set-key   (kbd "C-c C-a")         'mc/mark-all-like-this)    


(add-hook 'term-mode-hook 'term-config)

(provide 'init-keymap)
