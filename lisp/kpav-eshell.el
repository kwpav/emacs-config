;;; kpav-eshell.el --- -*- lexical-binding: t -*-

(use-package eshell
  :straight t)

(use-package multi-eshell
  :straight t
  :general
  (base-leader-def
    :states 'normal
    "ee" 'multi-eshell
    "en" 'multi-eshell-switch-to-next-live-shell
    "ep" 'multi-eshell-go-back))

(provide 'kpav-eshell)
;;; kpav-eshell.el ends here
