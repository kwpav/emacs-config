;;; kpav-code.el --- -*- lexical-binding: t -*-

(use-package company
  :straight t
  :config
  (global-company-mode +1))

(use-package flycheck
  :straight t
  :config
  (global-flycheck-mode +1))

;;; kpav-code.el --- -*- lexical-binding: t -*-

(use-package lsp-mode
  :straight t
  :gfhook
  #'lsp-enable-which-key-integration
  :commands lsp
  :init
  (setq lsp-completion-provider :capf
        lsp-keymap-prefix "C-l"))

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
