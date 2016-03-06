;; basic Feel
        ;; move selected lines like in sublime
        (defun move-text-internal (arg)
           (cond
            ((and mark-active transient-mark-mode)
             (if (> (point) (mark))
                    (exchange-point-and-mark))
             (let ((column (current-column))
                      (text (delete-and-extract-region (point) (mark))))
               (forward-line arg)
               (move-to-column column t)
               (set-mark (point))
               (insert text)
               (exchange-point-and-mark)
               (setq deactivate-mark nil)))
            (t
             (beginning-of-line)
             (when (or (> arg 0) (not (bobp)))
               (forward-line)
               (when (or (< arg 0) (not (eobp)))
                    (transpose-lines arg))
               (forward-line -1)))))
        (defun move-text-down (arg)
           "Move region (transient-mark-mode active) or current line
           arg lines down."
           (interactive "*p")
           (move-text-internal arg))
        (defun move-text-up (arg)
           "Move region (transient-mark-mode active) or current line
           arg lines up."
           (interactive "*p")
           (move-text-internal (- arg)))

        ;; TODO make case for unselected
        (defun move-by-one (arg)
          (if (or (and (= (max (point) (mark)) (point-max)) (> arg 0))
        	  (and (= (min (point) (mark)) (point-min)) (< arg 0)))
              (message "limit reached")
            (cond
             ((and mark-active transient-mark-mode)
              (let ((change? (< (point) (mark))) (text (delete-and-extract-region (point) (mark))))
        	(forward-char arg)
        	(set-mark (point))
        	(insert text)
        	(when change? (exchange-point-and-mark))
        	(setq deactivate-mark nil))))))
        
        (defun move-text-forward (arg)
          (interactive "*p")
          (move-by-one arg))
        
        (defun move-text-backward (arg)
          (interactive "*p")
          (move-by-one (- arg)))

        ;; select region by semantic unit
        (require 'expand-region)
;; end basic feel


;; tweaking the tabbar
      ;; TODO: factor out tabbar theming
      ;; TODO: get rid or change the ugly arrows
      ;; Tabbar
;;        (add-to-list 'load-path "~/.emacs.d/vendor/tabbar")
;;        (require 'tabbar)
;;        ;; Tabbar settings
;;        (set-face-attribute
;;         'tabbar-default nil
;;         :background "gray20"
;;         :foreground "gray20"
;;         :box '(:line-width 1 :color "gray20" :style nil))
;;        (set-face-attribute
;;         'tabbar-unselected nil
;;         :background "gray30"
;;         :foreground "white"
;;         :box '(:line-width 1 :color "gray30" :style nil))
;;        (set-face-attribute
;;         'tabbar-selected nil
;;         :background "#1a1a1a"
;;         :foreground "white"
;;         :box '(:line-width 8 :color "#1a1a1a" :style nil))
;;        (set-face-attribute
;;         'tabbar-highlight nil
;;         :background "white"
;;         :foreground "black"
;;         :underline nil
;;         :box '(:line-width 8 :color "white" :style nil))
;;        (set-face-attribute
;;         'tabbar-button nil
;;         :box '(:line-width 1 :color "gray20" :style nil))
;;        (set-face-attribute
;;         'tabbar-separator nil
;;         :background "gray20"
;;         :height 0.6)
;;        
;;        ;; Change padding of the tabs
;;        ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
;;        
;;        ;; adding spaces
;;        (defun tabbar-buffer-tab-label (tab)
;;          "Return a label for TAB.
;;        That is, a string used to represent it on the tab bar."
;;          (let ((label  (if tabbar--buffer-show-groups
;;                            (format "[%s]  " (tabbar-tab-tabset tab))
;;                          (format "%s  " (tabbar-tab-value tab)))))
;;            ;; Unless the tab bar auto scrolls to keep the selected tab
;;            ;; visible, shorten the tab label to keep as many tabs as possible
;;            ;; in the visible area of the tab bar.
;;            (if tabbar-auto-scroll-flag
;;                label
;;              (tabbar-shorten
;;               label (max 1 (/ (window-width)
;;                               (length (tabbar-view
;;                                        (tabbar-current-tabset)))))))))
;; end tweaking the tabbar

;; undo tree settings
        (require 'undo-tree)
        (global-undo-tree-mode)
;; end undo tree setting



;; autocomplete settings
        (setq company-dabbrev-downcase nil)
;; end autocomplete settings

;; helm setting
        (require 'helm)
        (require 'helm-config)
        
        ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
        ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
        ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
        (global-set-key (kbd "C-c h") 'helm-command-prefix)
        (global-unset-key (kbd "C-x c"))
        
        (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
        (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
        (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
        
        (when (executable-find "curl")
          (setq helm-google-suggest-use-curl-p t))
        
        (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
              helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
              helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
              helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
              helm-ff-file-name-history-use-recentf t)
        
        (helm-mode 1)
        (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
        (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
        (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
        (helm-autoresize-mode t)
        (global-set-key (kbd "M-x") 'helm-M-x)
        (global-set-key (kbd "M-y") 'helm-show-kill-ring)

        (global-set-key (kbd "C-x b") 'helm-mini)
        (setq helm-buffers-fuzzy-matching t
            helm-recentf-fuzzy-match    t)
        (global-set-key (kbd "C-x C-f") 'helm-find-files)
        (setq helm-semantic-fuzzy-match t
            helm-imenu-fuzzy-match    t)
        (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
;; end helm settings

;; navigation tree
       (require 'neotree)
;; end navigation tree


;; autopair
;;    (add-to-list 'load-path "~/.emacs.d/vendor/autopair") 
;;    (require 'autopair)
;;    (autopair-global-mode)
;; end autopair
;; smartparens
      (require 'smartparens-config)
      (smartparens-global-mode t)
      (show-smartparens-global-mode t)
      (set-face-attribute 'sp-pair-overlay-face nil :background "#443152")
;; end smartparens


;; multiple cursors
        (require 'multiple-cursors)
        ;;(require 'mark-multiple)
;; end multiple cursors
        
        ;; Edit string rectangles inline.
        ;; (global-set-key (kbd "C-x r t") 'inline-string-rectangle)

;; custom registers
        (set-register ?i (cons 'file "~/.emacs.d/init.el"))
        (set-register ?r (cons 'file "~/.emacs.d/im/init-resets.el"))
        (set-register ?l (cons 'file "~/.emacs.d/im/init-looks.el"))
        (set-register ?f (cons 'file "~/.emacs.d/im/init-feel.el"))
;; end custom registers


;; keybindgs
        ;; Tiling keys
          (global-set-key (kbd "<C-S-down>") 'shrink-window)
          (global-set-key (kbd "<C-S-up>") 'enlarge-window)
          (global-set-key (kbd "<C-S-left>") 'shrink-window-horizontally)
          (global-set-key (kbd "<C-S-right>") 'enlarge-window-horizontally)
        ;; Move lines
          (global-set-key (kbd "<M-up>") 'move-text-up)
          (global-set-key (kbd "<M-down>") 'move-text-down)
          (global-set-key (kbd "<M-right>") 'move-text-forward)
          (global-set-key (kbd "<M-left>")  'move-text-backward)
        ;; Cycle tabbar with usual Ctrl-Tab
          (global-set-key (kbd "<C-tab>") 'tabbar-forward)
          (global-set-key (kbd "<C-iso-lefttab>") 'tabbar-backward)
        ;; Better Buffer cycling
          (global-set-key (kbd "C-o") 'other-window)
        ;; Select semantic unit
          (global-set-key (kbd "M-n") 'er/expand-region)
          (global-set-key (kbd "M-m") 'er/contract-region)
        ;; force complete
          (global-set-key (kbd "C-p") 'company-complete)
        ;; fix terminal key redo for undo tree
          (global-set-key (kbd "M-/") 'undo-tree-redo)
        ;; Tree view
          (global-set-key (kbd  "C-x C-k C-b") 'neotree-toggle)
        ;; Multiple Cursors
          (global-unset-key (kbd "M-<down-mouse-1>"))
          (global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
          (global-set-key (kbd "C-c C-c") 'mc/edit-lines)
          (global-set-key (kbd "C-d") 'mc/mark-next-like-this)
          (global-set-key (kbd "C-c C-d") 'mc/mark-previous-like-this)
          (global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)    
;; end keybindgs

(provide 'init-feel)
