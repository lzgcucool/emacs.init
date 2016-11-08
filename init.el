;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(package-initialize)
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


;; close toolbar
(tool-bar-mode -1)
;; close menubar
(menu-bar-mode -1)
;; close scrollbar
(scroll-bar-mode -1)
;; close startup screen
(setq inhibit-splash-screen t)
;; open config file function
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)
;;(recentf-mode t)
(global-company-mode t)
(global-linum-mode t)
;; set cursor style
(setq-default cursor-type 'bar)
;; disable backup file
(setq make-backup-files nil)
(setq auto-save-default -1)
;; org mode seting
(require 'org)
(setq org-src-fontify-natively t)
;; recentf mode seting
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(delete-selection-mode t)
(setq  initial-frame-alist (quote ((fullscreen . maximized))))
(show-paren-mode 1)
;; (load-theme 'zenburn t)
(global-hl-line-mode 1)
(set-face-background 'hl-line' "#bbbbbb")
(require 'color-theme-sanityinc-solarized)
(color-theme-sanityinc-solarized--define-theme light)

(global-font-lock-mode t)
;; config hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Config counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(require 'smartparens-config)
(smartparens-global-mode t)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

(eval-after-load 'php-mode
  '(require 'php-ext))

;; coNfig org-agenda
(setq org-agenda-files '("~/.emacs.d/.org/"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; config popwin 
(require 'popwin)
(popwin-mode t)


(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("lzg" "lzgcucool")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
