;;; kpav-code.el --- -*- lexical-binding: t -*-

(use-package company
  :straight t
  :config
  (global-company-mode +1))

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
  :general
  (base-leader-def
    :states '(normal visual)
    "l" '(:ignore :wk "lsp")
    "lg" 'xref-find-definitions
    "lr" 'xref-find-references
    "lf" 'eglot-format
    "lF" 'eglot-format-buffer
    "la" 'eglot-code-actions
    "lo" 'eglot-code-actions-organize-imports
    "lh" 'eldoc))

(use-package eldoc
  :straight t)

(use-package xref
  :straight t)

(provide 'kpav-code)
;;; kpav-code.el ends here
