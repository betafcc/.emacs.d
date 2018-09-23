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

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(display-time-mode 1)
(display-battery-mode 1)
(setq column-number-mode t)


(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
