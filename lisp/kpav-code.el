;;; kpav-code.el --- -*- lexical-binding: t -*-

(use-package company
  :straight t
  :config
  (global-company-mode +1))

(use-package company-posframe
  :straight t
  :custom
  (company-tooltip-minimum-width 40)
  :config
  (company-posframe-mode +1))

(use-package flymake
  :straight t
  :ghook
  ('prog-mode-hook #'flymake-mode-on))

(use-package yasnippet
  :straight t
  :preface
  (defconst basemacs-snippets-dir (expand-file-name "snippets/" user-emacs-directory))
  (make-directory basemacs-snippets-dir :parents)
  :custom
  (yas-snippet-dirs (list basemacs-snippets-dir))
  :config
  (yas-global-mode +1))

(use-package yasnippet-snippets
  :straight t
  :after yasnippet)

(use-package eglot
  :straight t
  :custom
  (eglot-connect-timeout 120)
  :general
  (base-leader-def
    :states '(normal visual)
    "l" '(:ignore :wk "lsp")
    "lg" 'xref-find-definitions
    "lr" 'xref-find-references
    "lb" 'xref-go-back
    "lf" 'eglot-format
    "lF" 'eglot-format-buffer
    "la" 'eglot-code-actions
    "lo" 'eglot-code-actions-organize-imports
    "lR" 'eglot-rename
    "lh" 'eldoc))

(use-package eldoc
  :straight t)

(use-package eldoc-box
  :straight t
  :ghook
  ('eglot-managed-mode-hook #'eldoc-box-hover-mode t))

(provide 'kpav-code)
;;; kpav-code.el ends here
