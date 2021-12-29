;;; init.el --- -*- lexical-binding: t no-byte-compile: t -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'basemacs-core)

(use-package emacs
  :init
  (defconst basemacs-leader "SPC")
  (defconst basemacs-local-leader "SPC m"))

;; emacs
(require 'kpav-system)
(require 'kpav-evil)
(require 'kpav-keys)
(require 'kpav-selectrum)
(require 'kpav-org)
(require 'kpav-ui)
(require 'kpav-windows-and-buffers)
;; tools
(require 'kpav-project)
(require 'kpav-git)
(require 'kpav-vterm)
;; code
(require 'kpav-lsp)
(require 'kpav-php)
(require 'kpav-elisp)
(require 'kpav-clojure)
(require 'kpav-common-lisp)
(require 'kpav-js)

(defconst kpav-local-file (expand-file-name "lisp/kpav-local.el" user-emacs-directory))

(when (file-exists-p kpav-local-file)
  (load kpav-local-file))

(use-package emacs
  :straight (:type built-in)
  :general
  ("<escape>" 'keyboard-escape-quit))

(use-package emacs
  :straight (:type built-in)
  :init
  (setq native-comp-async-report-warnings-errors nil))

(provide 'init)
;;; init.el ends here
