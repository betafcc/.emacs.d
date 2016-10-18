;; TODO
;; Generalize build system
;; this file here should only (add-hook 'js2-mode-hook (lambda () (setq eval-command "node"))))

;; TODO
;; Comment region change keybind

;; TODO rename functions


;;(defun node-eval ()
;;  (interactive)
;;  (if (region-active-p)
;;      (shell-transform-selected "node")
;;    (shell-eval-buffer "node")))


(add-hook 'python-mode-hook
	  (lambda () 
	    (setq build-command "python3.6")))

(provide 'init-python)
