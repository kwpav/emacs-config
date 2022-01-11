;;; kpav-project.el --- -*- lexical-binding: t -*-

(use-package project
  :straight (:type built-in)
  :general
  (base-leader-def
   :states 'normal
   "p" '(:ignore t :wk "projects")
   "pf" 'project-find-file
   "pb" 'project-switch-to-buffer))

(use-package projectile
  :straight t
  :init
  (use-package ripgrep :straight t)
  :general
  (base-leader-def
   :states 'normal
   "p" '(:ignore t :wk "projects")
   "pd" 'projectile-find-dir
   "pp" 'projectile-switch-project
   "pg" 'consult-ripgrep
   "pG" 'consult-git-grep)
  :config
  (projectile-mode +1))

(use-package treemacs
  :straight t
  :defer t
  :general
  ([f8] 'treemacs)
  (base-leader-def
    :states '(normal)
    "po" 'treemacs))

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
