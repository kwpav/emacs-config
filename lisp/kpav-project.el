;;; kpav-project.el --- -*- lexical-binding: t -*-

(use-package project
  :straight (:type built-in)
  :general
  (base-leader-def
   :states 'normal
   "p" '(:ignore t :wk "projects")
   "pf" 'project-find-file
   "pg" 'consult-ripgrep
   "pG" 'consult-git-grep))

(use-package treemacs
  :straight t
  :defer t
  :general ([f8] 'treemacs))

(use-package treemacs-evil
  :straight t
  :after (evil treemacs))

(use-package treemacs-magit
  :straight t
  :after (treemacs))

(use-package envrc
  :straight t
  :config
  (envrc-global-mode))

(provide 'kpav-project)
;;; kpav-project.el ends here
