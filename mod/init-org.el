;; org mode seting
(require 'org)
(setq org-src-fontify-natively t)
;; coNfig org-agenda
(setq org-agenda-files '("~/.emacs.d/.org/"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
