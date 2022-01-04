;;; init.el --- -*- lexical-binding: t no-byte-compile: t -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'basemacs-core)

(use-package emacs
  :straight (:type built-in)
  :custom
  (basemacs-leader "SPC")
  (basemacs-local-leader "SPC m"))

;; emacs
(use-package kpav-defaults)
(use-package kpav-system)
(use-package kpav-evil)
(use-package kpav-keys)
(use-package kpav-narrowing)
(use-package kpav-org)
(use-package kpav-ui)
(use-package kpav-windows-and-buffers)
;; tools
(use-package kpav-project)
(use-package kpav-git)
(use-package kpav-vterm)
;; code
(use-package kpav-code)
(use-package kpav-php)
(use-package kpav-elisp)
(use-package kpav-clojure)
(use-package kpav-common-lisp)
(use-package kpav-js)
(use-package kpav-c)

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

(defun kpav/minor-modes ()
  (interactive)
  (completing-read
   "Minor modes: "
   local-minor-modes
   nil t))

(provide 'init)
;;; init.el ends here
