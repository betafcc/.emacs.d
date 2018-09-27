(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

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

;; emacs treats camelCase as single word, this fixes it
(global-subword-mode 1)

(show-paren-mode 1)
(setq electric-pair-pairs
      '((?\{ . ?\})
        (?\( . ?\))
        (?\[ . ?\])
        (?\" . ?\")
        ))
(electric-pair-mode t)


;; (global-prettify-symbols-mode t)


(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package xclip
  :ensure t
  :init
  (xclip-mode 1))

(use-package solarized-theme
  :ensure t
  :init
  (setq solarized-distinct-fringe-background t)
  (setq solarized-high-contrast-mode-line t)
  (setq solarized-use-more-italic t)
  (setq solarized-scale-org-headlines t)
  (load-theme 'solarized-light t))

;; cursor stuff
;; TODO: fix cursor color when launching from daemon
;; https://emacs.stackexchange.com/questions/13291
(global-hl-line-mode 1)
(blink-cursor-mode -1)
(setq-default cursor-type '(bar . 3))
(set-cursor-color "#ff8676")


(use-package beacon
  :ensure t
  :init
  (beacon-mode 1)
  :config
  (setq beacon-color "#f8a53a"))

(use-package centered-cursor-mode
  :ensure t
  :bind ("C-M-l" . 'centered-cursor-mode))


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

(use-package org
  :mode ("\\.org\\'"  . org-mode)
  :config
  (setq org-ellipsis "▼"))


(use-package org-indent
  :hook (org-mode . org-indent-mode))

(use-package org-bullets
  :ensure t
  :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(use-package ob
  :defer t
  :config
  (setq org-confirm-babel-evaluate nil)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (shell . t)
     (js . t))))

;; TODO: add a keybinding to it maybe?
;; (add-to-list 'default-frame-alist '(undecorated . t))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
