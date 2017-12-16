(package-initialize)

(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "settings/modes" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "looks" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "looks/themes" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'init-packages)
(require 'init-requires)
(require 'init-misc)
(require 'init-resets)
(require 'init-looks)
(require 'init-mode-map)
(require 'init-keymap)
