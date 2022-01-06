;;; kpav-project.el --- -*- lexical-binding: t -*-

(use-package projectile
  :straight t
  :init
  (use-package ripgrep :straight t)
  :general
  (base-leader-def
   :states 'normal
   "p" '(:ignore t :wk "projects")
   "pf" 'projectile-find-file
   "pd" 'projectile-find-dir
   "pb" 'projectile-switch-to-buffer
   "pp" 'projectile-switch-project
   "pg" 'projectile-ripgrep)
  :config
  (projectile-mode +1))

(use-package treemacs
  :straight t
  :defer t
  :general ([f8] 'treemacs))

(use-package treemacs-evil
  :straight t
  :after (evil treemacs))

(use-package treemacs-magit
  :straight t
  :after (treemacs magit))

(use-package envrc
  :straight t
  :config
  (envrc-global-mode +1))

(provide 'kpav-project)
;;; kpav-project.el ends here
