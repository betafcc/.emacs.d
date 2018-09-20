;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'auto-mode-alist '("\\.cl\\'" . common-lisp-mode))


(with-eval-after-load 'python (require 'init-python))
(with-eval-after-load 'haskell-mode (require 'init-haskell))
(with-eval-after-load 'js (require 'init-javascript))
(with-eval-after-load 'cc-mode (require 'init-cpp))

(provide 'init-mode-map)
