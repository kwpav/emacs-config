;;; kpav-scheme.el --- -*- lexical-binding: t -*-
(require 'kpav-lisp-core)

(use-package geiser
  :straight t
  :custom
  (geiser-activate-implementations '(guile)))

(use-package geiser-guile
  :straight t)

(provide 'kpav-scheme)
;;; kpav-scheme.el ends here
