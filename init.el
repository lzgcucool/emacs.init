;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; add module path
(add-to-list 'load-path "~/.emacs.d/mod/")
;; load module
(require 'init-func)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
;; set custom
(setq custom-file (expand-file-name "mod/custom.el" user-emacs-directory))
(load-file custom-file)
;; mac seting
;;(setq mac-option-modifier 'meta)
;;(setq mac-command-modifier 'super)
