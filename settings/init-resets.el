(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq c-default-style "python"
      c-basic-offset 4)

;; EMACS IS HORRIBLE WITH IT'S
;; "SMART" TAB AND INDENTATION
;; this just disables it
(setq indent-line-function 'insert-tab)
(electric-indent-mode -1)
;; Use (add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1))) to override the electric-indent-mode state set by any major mode.

(setq-default python-shell-interpreter "python")
(setq-default python-shell-completion-native-enable nil)


;; fix dead keys issues
(require 'iso-transl)

;; when start typing and something is selected, substitute it
(delete-selection-mode 1)

;; Makes *scratch* empty
(setq initial-scratch-message "")
;; Removes *scratch* from buffer after the mode has been set
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(defun remove-completions-buffer ()
  (let ((buffer "*Completions*"))
    (and (get-buffer buffer)
         (kill-buffer buffer))))
(add-hook 'minibuffer-exit-hook 'remove-completions-buffer)

;; Don't show *Buffer list* when opening multiple files at the same time
(setq inhibit-startup-buffer-menu t)


;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)
;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; change '~file' directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;;; Shut up compile saves
(setq compilation-ask-about-save nil)
;;; Don't save *anything*
(setq compilation-save-buffers-predicate '(lambda () nil))


(provide 'init-resets)
