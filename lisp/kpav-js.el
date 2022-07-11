;;; kpav-js.el --- -*- lexical-binding: t -*-

(use-package js-mode
  :straight (:type built-in)
  :mode "\\.js\\'"
  :interpreter "node"
  :gfhook
  ;;#'lsp
  #'eglot-ensure)

(use-package typescript-mode
  :straight t
  :mode "\\.ts\\'"
  :commands (typescript-mode)
  :gfhook
  ;;#'lsp
  #'eglot-ensure)

(use-package json-mode
  :straight t
  :mode "\\.json\\'")

(provide 'kpav-js)
;;; kpav-js.el ends here
