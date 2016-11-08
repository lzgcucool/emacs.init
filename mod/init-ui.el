;; close toolbar
(tool-bar-mode -1)
;; close menubar
(menu-bar-mode -1)
;; close scrollbar
(scroll-bar-mode -1)
;; close startup screen
(setq inhibit-splash-screen t)
;; set cursor style
(setq-default cursor-type 'bar)
;; fullscreen seting
(setq  initial-frame-alist (quote ((fullscreen . maximized))))
;; show hl
(global-hl-line-mode 1)
(set-face-background 'hl-line' "#bbbbbb")
(global-font-lock-mode t)

(provide 'init-ui)
