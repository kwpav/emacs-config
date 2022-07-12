;;; kpav-c.el --- -*- lexical-binding: t -*-

(use-package ccls
  :straight t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) ;;(lsp)
           (eglot)))
  :config
  (setq ccls-executable "/usr/bin/ccls")
  ;; use flycheck instead of flymake
  ;;(setq lsp-prefer-flymake nil)
  (setq lsp-prefer-flymake t)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc)))

(provide 'kpav-c)
;;; kpav-c.el ends here
