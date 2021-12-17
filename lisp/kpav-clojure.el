;;; kpav-clojure.el --- -*- lexical-binding: t -*-
(require 'kpav-lisp-core)

(use-package clojure-mode
  :straight t
  :defer t
  :ghook
  ('clojure-mode-hook #'lsp)
  ('clojurec-mode-hook #'lsp)
  ('clojurescript-mode #'lsp)
  :custom
  (lsp-enable-indentation nil))
;; is this needed?
;; :config
;; (dolist (m '(clojure-mode
;;              clojurec-mode
;;              clojurescript-mode
;;              clojurex-mode))
;;   (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))

(use-package cider
  :straight t
  :after clojure-mode
  :ghook
  ('cider-repl-mode-hook #'rainbow-delimiters-mode)
  ('cider-connected-hook #'cider-upgrade-nrepl-connection)
  :custom
  (cider-inject-dependencies-at-jack-in t)
  :general
  (base-local-leader-def
    :states '(normal visual)
    :keymaps 'clojure-mode-map
    "r" 'cider
    "n" 'cider-repl-set-ns
    "er" 'cider-eval-region
    "eb" 'cider-eval-buffer
    "ef" 'cider-eval-sexp-at-point
    "el" 'cider-eval-last-sexp))

(use-package clj-refactor
  :straight t
  :after cider
  :ghook
  ('clojure-mode-hook (lambda ()
                        (clj-refactor-mode 1)
                        (yas-minor-mode 1) ; for adding require/use/imoprt statements
                        ;; Leaves cider-macroexpand-1 unbound
                        (cljr-add-keybindings-with-prefix "C-c C-m"))))

(use-package cider-eval-sexp-fu
  :straight t)

(provide 'kpav-clojure)
;;; kpav-clojure.el ends here
