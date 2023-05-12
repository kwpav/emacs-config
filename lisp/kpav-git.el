;;; kpav-git.el --- -*- lexical-binding: t -*-

(use-package magit
  :straight t
  :defer t
  :general
  ("C-x g" 'magit-status)
  ;; (base-leader-def
  ;;   :states 'normal
  ;;   "g" '(:ignore t :wk "git")
  ;;   "gs" 'magit-status
  ;;   "gc" 'magit-checkout
  ;;   "gC" 'magit-commit
  ;;   "gb" 'magit-blame
  ;;   "gS" 'magit-stage-file
  ;;   "gU" 'magit-unstage-file
  ;;   "gy" 'kpav/magit-yank-branch-name)
  :init
  (meow-leader-define-key
   '("ss" . magit-status)
   '("sc" . magit-checkout)
   '("sC" . magit-commit)
   '("sb" . magit-blame)
   '("sS" . magit-stage-file)
   '("sU" . magit-unstage-file)
   '("sy" . kpav/magit-yank-branch-name))
  :config
  (defun kpav/magit-yank-branch-name ()
    "Show the current branch in the echo-area and add it to the `kill-ring'."
    (interactive)
    (let ((branch (magit-get-current-branch)))
      (if branch
          (progn (kill-new branch)
                 (message "%s" branch))
        (user-error "There is not current branch")))))

(use-package git-gutter-fringe
  :straight t
  :config
  (global-git-gutter-mode +1)
  (setq-default fringes-outside-margins t))

(use-package git-timemachine
  :straight t
  :defer t
  ;:general
  ;; (base-leader-def
  ;;   :states 'normal
  ;;   "gt" 'git-timemachine)
  :init
  (meow-leader-define-key
   '("gt" . git-timemachine)))

(use-package git-link
  :straight t
  ;:general
  ;; (base-leader-def
  ;;   :states '(normal visual)
  ;;   "gl" '(:ignore t :wk "git link")
  ;;   "gll" 'git-link
  ;;   "glc" 'git-link-commit
  ;;   "glh" 'git-link-homepage)
  :init
  (meow-leader-define-key
   '("sll" . git-link)
   '("slc" . git-link-commit)
   '("slh" . git-link-homepage)))

(provide 'kpav-git)
;;; kpav-git.el ends here
