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
			     web-mode
			     expand-region
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
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

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

(setq auto-mode-alist
      (append
       '(("\\.html'" . web-mode)
	 )
       auto-mode-alist))

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 4) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 4)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 4)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))
        (setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

(provide 'init-packages)
