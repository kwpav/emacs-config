;;; kpav-lsp.el --- -*- lexical-binding: t -*-

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

(provide 'kpav-lsp)
;;; kpav-lsp.el ends here
