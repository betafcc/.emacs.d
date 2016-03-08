(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; fix dead keys issues
(require 'iso-transl)


;; feels resets
        ;; Makes *scratch* empty.
;;        (setq initial-scratch-message "")
        ;; Removes *scratch* from buffer after the mode has been set.
;;        (defun remove-scratch-buffer ()
;;          (if (get-buffer "*scratch*")
;;              (kill-buffer "*scratch*")))
;;        (add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
        ;; Removes *messages* from the buffer.
        (setq-default message-log-max nil)
        (kill-buffer "*Messages*")
        ;; Removes *Completions* from buffer after you've opened a file.
        (add-hook 'minibuffer-exit-hook
              '(lambda ()
                 (let ((buffer "*Completions*"))
                   (and (get-buffer buffer)
                        (kill-buffer buffer)))))
        ;; Don't show *Buffer list* when opening multiple files at the same time.
        (setq inhibit-startup-buffer-menu t)
        ;; Show only one active window when opening multiple files at the same time.
        (add-hook 'window-setup-hook 'delete-other-windows)
        ;; No more typing the whole yes or no. Just y or n will do.
        (fset 'yes-or-no-p 'y-or-n-p)


        ;;; Shut up compile saves
        (setq compilation-ask-about-save nil)
        ;;; Don't save *anything*
        (setq compilation-save-buffers-predicate '(lambda () nil))

;; end feels resets

(provide 'init-resets)
