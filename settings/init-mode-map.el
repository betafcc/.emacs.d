;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'auto-mode-alist '("\\.cl\\'" . common-lisp-mode))

(eval-after-load 'python-mode  '(require 'init-python))
(eval-after-load 'haskell-mode '(require 'init-haskell))
(eval-after-load 'js-mode '(require 'init-javascript))
(eval-after-load 'cc-mode '(require 'init-cpp))


(provide 'init-mode-map)
