;;; init.el --- -*- lexical-binding: t no-byte-compile: t -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'basemacs-core)

(use-package basemacs-core
  :custom
  (basemacs-leader "C-c")
  (basemacs-local-leader "C-c m"))

;; emacs
(require 'kpav-defaults)
(require 'kpav-system)
(require 'kpav-meow)
;; (require 'kpav-evil)
(require 'kpav-keys)
(require 'kpav-narrowing)
(require 'kpav-org)
(require 'kpav-ui)
(require 'kpav-windows-and-buffers)
;; prose
(require 'kpav-markdown)
(require 'kpav-org-roam)
;; tools
(require 'kpav-project)
(require 'kpav-git)
(require 'kpav-vterm)
;; (require 'kpav-eshell)
(require 'kpav-docker)
(require 'kpav-irc)
(require 'kpav-guix)
;; code
(require 'kpav-code)
(require 'kpav-php)
(require 'kpav-elisp)
(require 'kpav-clojure)
(require 'kpav-common-lisp)
(require 'kpav-scheme)
(require 'kpav-js)
(require 'kpav-python)
;; (require 'kpav-c)
(require 'kpav-yaml)
;; (require 'kpav-grpc)
(require 'kpav-graphql)
(require 'kpav-nix)

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
