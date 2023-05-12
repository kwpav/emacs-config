;;; kpav-org.el --- -*- lexical-binding: t -*-

(use-package org
  :straight t
  :general
  (org-src-mode-map
   [remap evil-save-and-close] 'org-edit-src-exit
   [remap evil-save-modified-and-close] 'org-edit-src-exit
   [remap evil-quit] 'org-edit-src-abort)
  ;; (base-leader-def
  ;;   :states 'normal
  ;;   "a" 'org-agenda)
  (base-local-leader-def
    :keymaps 'org-mode-map
    :states 'normal
    "b" 'org-babel-tangle)
  :preface
  (defun my-disable-flycheck-for-elisp ()
    (setq flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
  :gfhook
  ('org-src-mode-hook #'my-disable-flycheck-for-elisp)
  #'visual-line-mode
  :init
  (meow-leader-define-key
   '("a" . org-agenda))
  (setq org-startup-indented t)
  :custom
  (org-agenda-files (list "~/org/agenda/" "~/org/roam/work/jira/"))
  (org-use-fast-todo-selection t)
  (org-todo-keywords
   '((sequence "TODO(t)" "NEXT(n)" "CURRENT(c)" "|" "DONE(d)")
     (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(a@/!)")))
  ;; Styling
  (org-auto-align-tags nil)
  (org-tags-column 0)
  (org-hide-emphasis-markers t)
  (org-pretty-entities t)
  (org-ellipsis "…")
  :config
  ;; structure template completion
  (require 'org-tempo))

(use-package org-contrib
  :straight t)

(use-package org-superstar
  :straight t
  :ghook
  ('org-mode-hook (lambda () (org-superstar-mode +1))))

(use-package org-capture
  :straight nil
  :general
  ;; (base-leader-def
  ;;   :states 'normal
  ;;   "C" 'org-capture)
  :custom
  (org-capture-templates
   '(("t" "Todo" entry (file+headline "~/org/agenda/todo.org" "Tasks")
      "* TODO %?\n %i\n %^{LINK}p")
     ("g" "Grow Log" entry (file+olp+datetree "~/grow/grow.org" "Log")
      "* Day Xn\n** Log\n** Notes\n %?\n %i\n"))
   :init
   (meow-leader-define-key
    '("C" . org-capture))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((clojure . t)
   (sql . t)
   (emacs-lisp . t)
   (js . t)
   (python . t)))

(provide 'kpav-org)
;;; kpav-org.el ends here
