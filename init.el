(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(global-hl-line-mode 1)
;; solves uggly modeline underline
;; https://github.com/bbatsov/solarized-emacs/issues/187
(setq x-underline-at-descent-line t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(display-time-mode 1)
(setq column-number-mode t)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(global-set-key (kbd "<C-S-return>") 'ansi-term)

(setq scroll-conservatively 100)
(setq ring-bell-function 'ignore)

(show-paren-mode 1)
(global-prettify-symbols-mode t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package solarized-theme
  :ensure t
  :init (load-theme 'solarized-light t))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1)
  :config
  (setq beacon-color "#F8A53A"))

(use-package rainbow-mode
  :ensure t
  :init
    (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package fancy-battery
  :ensure t
  :config
    (setq fancy-battery-show-percentage t)
    (setq battery-update-interval 15)
    (if window-system
      (fancy-battery-mode)
      (display-battery-mode)))


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
