
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


;; basic Feel
(require 'move-text)

;; select region by semantic unit
(require 'expand-region)

;; coment line but preserve cursor position
(defun comment-line-stay (arg)
  (interactive "*p")
  (save-excursion
    (comment-line arg)))    
;; end basic feel

;; custom functions
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


(add-hook 'term-mode-hook 'term-config)

(defun create-scratch-buffer nil
  "create a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "-scratch-"))
  (lisp-interaction-mode))


(require 'undo-tree)
(global-undo-tree-mode)

;; autocomplete settings
(setq company-dabbrev-downcase nil)
;; end autocomplete settings

(require 'init-helm)
(require 'init-org)
(require 'neotree)

;; autopair
;;    (add-to-list 'load-path "~/.emacs.d/vendor/autopair") 
;;    (require 'autopair)
;;    (autopair-global-mode)
;; end autopair
;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; end smartparens

;; sublime-like multiple cursors
(require 'multiple-cursors)
;;(require 'mark-multiple)


;; aling command
;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)
(global-set-key (kbd "C-x |") 'align-regexp)
;; end align command

;; custom registers
(set-register ?i (cons 'file "~/.emacs.d/init.el"            ))
(set-register ?r (cons 'file "~/.emacs.d/im/init-resets.el"  ))
(set-register ?l (cons 'file "~/.emacs.d/im/init-looks.el"   ))
(set-register ?f (cons 'file "~/.emacs.d/im/init-feel.el"    ))
(set-register ?t (cons 'file "~/workspace/todo/org/todo.org" ))
;; end custom registers


;; keybindgs
;; General Build
(require 'build)
(global-set-key (kbd "C-c C-b") 'build-eval)

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
;; Select semantic unit
(global-set-key   (kbd "M-=")             'er/expand-region)
(global-set-key   (kbd "M--")             'er/contract-region)
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
;; end keybindgs

(provide 'init-feel)
