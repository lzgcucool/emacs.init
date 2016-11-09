(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(require 'cl)
(defvar lzgcucool/packages '(
			     company
			     zenburn-theme
			     hungry-delete
			     swiper
			     counsel
			     smartparens
			     exec-path-from-shell
			     php-mode
			     color-theme-sanityinc-solarized
			     monokai-theme
			     popwin
			     reveal-in-osx-finder
			     ) "Default packages")
(setq package-selected-packages lzgcucool/packages)
(defun lzgcucool/packages-installed-p()
  (loop for pkg in lzgcucool/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (lzgcucool/packages-installed-p)
  (message "%s" "Refreshing packsge database...")
  (package-refresh-contents)
  (dolist (pkg lzgcucool/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(global-company-mode t)

;; config hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Config counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; (require 'smartparens-config)
(smartparens-global-mode t)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(eval-after-load 'php-mode
  '(require 'php-ext))

;; config popwin 
(require 'popwin)
(popwin-mode t)


;; (load-theme 'zenburn t)
(require 'color-theme-sanityinc-solarized)
(color-theme-sanityinc-solarized--define-theme light)

(provide 'init-packages)
