;;; kpav-clojure.el --- -*- lexical-binding: t -*-
(require 'kpav-lisp-core)

(use-package clojure-mode
  :straight t
  :defer t
  :ghook
  ;; ('clojure-mode-hook #'lsp)
  ;; ('clojurec-mode-hook #'lsp)
  ;; ('clojurescript-mode #'lsp)
  ('clojure-mode-hook #'eglot-ensure)
  ('clojurec-mode-hook #'eglot-ensure)
  ('clojurescript-mode #'eglot-ensure)
  ;; :custom
  ;; (lsp-enable-indentation nil)
  )
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
  ;; ('cider-connected-hook #'cider-upgrade-nrepl-connection)
  :custom
  (cider-inject-dependencies-at-jack-in t)
  :general
  (base-local-leader-def
    ;:states '(normal visual)
    :keymaps 'clojure-mode-map
    "r" '(:ignore t :wk "repl")
    "rr" 'cider
    "rR" 'cider-restart
    "rn" 'cider-repl-set-ns
    "rb" 'cider-switch-to-repl-buffer
    "rc" 'cider-find-and-clear-repl-output
    "rl" 'cider-load-buffer
    "rq" 'cider-quit
    ;; eval
    "eD" 'cider-insert-defun-in-repl
    "eE" 'cider-insert-last-sexp-in-repl
    "eR" 'cider-insert-region-in-repl
    "eb" 'cider-eval-buffer
    "ed" 'cider-eval-defun-at-point
    "ee" 'cider-eval-last-sexp
    "er" 'cider-eval-region
    "eu" 'cider-undef
    "em" 'cider-macroexpand-1
    "eM" 'cider-macroexpand-all
    ;; help
    "h" '(:ignore t :wk "help")
    "ha" 'cider-apropos
    "hh" 'cider-doc
    "hj" 'cider-javadoc
    "hn" 'cider-browse-ns
    "hN" 'cider-browse-ns-all
    "hs" 'cider-browse-spec
    "hS" 'cider-browse-spec-all
    ;; inspect
    "i" '(:ignore t :wk "inspect")
    "ii" 'cider-inspect
    "ie" 'cider-enlighten-mode
    "ir" 'cider-inspect-last-result
    ;; pprint
    "p" '(:ignore t :wk "pprint")
    "pd" 'cider-pprint-eval-defun-at-point
    "pD" 'cider-pprint-eval-defun-to-comment
    "pD" 'cider-pprint-eval-last-sexp-to-repl
    ;; format
    "f" '(:ignore t :wk "format")
    "fr" 'cider-format-region
    "fb" 'cider-format-buffer
    "ff" 'cider-format-defun
    ;; goto
    "g" '(:ignore t :wk "goto")
    "gg" 'cider-find-dwim
    "gv" 'cider-find-var
    "gn" 'cider-find-ns
    "gN" 'cider-browse-ns-all
    "d" '(:ignore t :wk "debug")
    "dr" 'cider-ns-reload
    "dR" 'cider-ns-reload-all
    "di" 'cider-inspect-defun-at-point)
  :init
  ;; (meow-leader-define-key
  ;;  '("mrr" . cider)
  ;;  '("mrR" . cider-restart)
  ;;  '("mrn" . cider-repl-set-ns)
  ;;  '("mrb" . cider-switch-to-repl-buffer)
  ;;  '("mrc" . cider-find-and-clear-repl-output)
  ;;  '("mrl" . cider-load-buffer)
  ;;  '("mrq" . cider-quit)
  ;;   ;; eval
  ;;  '("meD" . cider-insert-defun-in-repl)
  ;;  '("meE" . cider-insert-last-sexp-in-repl)
  ;;  '("meR" . cider-insert-region-in-repl)
  ;;  '("meb" . cider-eval-buffer)
  ;;  '("med" . cider-eval-defun-at-point)
  ;;  '("mee" . cider-eval-last-sexp)
  ;;  '("mer" . cider-eval-region)
  ;;  '("meu" . cider-undef)
  ;;  '("mem" . cider-macroexpand-1)
  ;;  '("meM" . cider-macroexpand-all)
  ;;   ;; help
  ;;  '("mha" . cider-apropos)
  ;;  '("mhh" . cider-doc)
  ;;  '("mhj" . cider-javadoc)
  ;;  '("mhn" . cider-browse-ns)
  ;;  '("mhN" . cider-browse-ns-all)
  ;;  '("mhs" . cider-browse-spec)
  ;;  '("mhS" . cider-browse-spec-all)
  ;;   ;; inspect
  ;;  '("mii" . cider-inspect)
  ;;  '("mie" . cider-enlighten-mode)
  ;;  '("mir" . cider-inspect-last-result)
  ;;   ;; pprint
  ;;  '("mpd" . cider-pprint-eval-defun-at-point)
  ;;  '("mpD" . cider-pprint-eval-defun-to-comment)
  ;;  '("mpD" . cider-pprint-eval-last-sexp-to-repl)
  ;;   ;; format
  ;;  '("mfr" . cider-format-region)
  ;;  '("mfb" . cider-format-buffer)
  ;;  '("mff" . cider-format-defun)
  ;;   ;; goto
  ;;  '("mgg" . cider-find-dwim)
  ;;  '("mgv" . cider-find-var)
  ;;  '("mgn" . cider-find-ns)
  ;;  '("mgN" . cider-browse-ns-all)
  ;;  ;; debug
  ;;  '("mdr" . cider-ns-reload)
  ;;  '("mdR" . cider-ns-reload-all)
  ;;  '("mdi" . cider-inspect-defun-at-point))
  )

(use-package clj-refactor
  :straight t
  :after cider
  :ghook
  ('clojure-mode-hook (lambda ()
                        (clj-refactor-mode +1)
                        (yas-minor-mode +1) ; for adding require/use/import statements
                        ;; Leaves cider-macroexpand-1 unbound
                        (cljr-add-keybindings-with-prefix "C-c C-m")))
  :general
  (base-local-leader-def
    :states '(normal visual)
    :keymaps 'clojure-mode-map
    "R" 'hydra-cljr-help-menu/body))

(use-package cider-eval-sexp-fu
  :straight t)

(provide 'kpav-clojure)
;;; kpav-clojure.el ends here
