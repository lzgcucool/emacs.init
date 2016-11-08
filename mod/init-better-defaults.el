(setq ring-bell-function 'ignore)
;; open linum-mode
(global-linum-mode t)
(global-auto-revert-mode t)
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("lzg" "lzgcucool")))
;; disable backup file
(setq make-backup-files nil)
(setq auto-save-default -1)
;; recentf mode seting
;;(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(delete-selection-mode t)

(provide 'init-better-defaults)
