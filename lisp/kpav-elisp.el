;;; kpav-elisp.el --- -*- lexical-binding: t -*-
(require 'kpav-lisp-core)

(use-package emacs
  :straight (:type built-in)
  :general
  (base-local-leader-def
   :states '(normal visual)
   :keymaps 'emacs-lisp-mode-map
   "e" '(:ignore t :wk "eval")
   "eb" 'eval-buffer
   "el" 'eval-last-sexp
   "ed" 'eval-defun
   "er" 'eval-region)
  (base-local-leader-def
   :states 'normal
   :keymaps 'lisp-interaction-mode-map
   "e" '(:ignore t :wk "eval")
   "eb" 'eval-buffer
   "el" 'eval-last-sexp
   "ed" 'eval-defun
   "er" 'eval-region))

(provide 'kpav-elisp)
;;; kpav-elisp.el ends here
