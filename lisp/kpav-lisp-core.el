;;; kpav-lisp-core.el --- -*- lexical-binding: t -*-

(defconst kpav-lisp-mode-hooks
  '(lisp-mode-hook
    ;; sly-mrepl-mode-hook
    emacs-lisp-mode-hook
    clojure-mode-hook
    ;; cider-repl-mode-hook
    ))

(use-package paredit
  :straight t
  :ghook kpav-lisp-mode-hooks)

;; (use-package lispy
;;   :straight t
;;   :ghook kpav-lisp-mode-hooks)

;; (use-package lispyville
;;   :straight t
;;   :ghook
;;   ('lispy-mode-hook #'lispyville-mode))

;; (use-package symex
;;   :straight t
;;   :custom
;;   (symex-modal-backend 'evil)
;;   :general
;;   ("C-'" 'symex-mode-interface)
;;   (:keymaps 'normal
;;             (general-chord "jk") 'symex-mode-interface)
;;   :config
;;   (symex-initialize))

;; (use-package aggressive-indent
;;   :straight t
;;   :ghook kpav-lisp-mode-hooks)

(use-package eval-sexp-fu
  :straight t
  :ghook
  (kpav-lisp-mode-hooks #'eval-sexp-fu-flash-mode))

(provide 'kpav-lisp-core)
;;; kpav-lisp-core.el ends here
