;;; kpav-code.el --- -*- lexical-binding: t -*-

(use-package corfu
  :straight t
  :custom
  (corfu-auto t)
  (corfu-quit-no-match 'separator)
  :init
  (global-corfu-mode))

;; A few more useful configurations...
(use-package emacs
  :straight (:type built-in)
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
  ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete))

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
    "lo" 'eglot-code-action-organize-imports
    "lR" 'eglot-rename
    "lh" 'eldoc))

(use-package eldoc
  :straight t)

(use-package xref
  :straight t)

(use-package eldoc-box
  :straight t
  :ghook
  ('eglot-managed-mode-hook #'eldoc-box-hover-mode t))

(use-package tree-sitter
  :defer t
  :straight t)

(use-package tree-sitter-langs
  :after tree-sitter
  :straight t)

(provide 'kpav-code)
;;; kpav-code.el ends here
