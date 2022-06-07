;;; kpav-code.el --- -*- lexical-binding: t -*-

(use-package company
  :straight t
  :config
  (global-company-mode +1))

(use-package flycheck
  :straight t
  :config
  (global-flycheck-mode +1))

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

(use-package lsp-mode
  :straight t
  :gfhook
  #'lsp-enable-which-key-integration
  :commands lsp
  :init
  (setq lsp-completion-provider :capf
        lsp-keymap-prefix "C-l")
  :custom
  ;; I don't find the headerline very helpful,
  ;; the modeline shows most of it anyway
  (lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-show-code-actions nil))

(use-package lsp-treemacs
  :straight t
  :commands lsp-treemacs-errors-list)

(use-package dap-mode
  :straight t
  :defer t)

(provide 'kpav-code)
;;; kpav-code.el ends here
