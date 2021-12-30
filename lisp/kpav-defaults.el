;;; kpav-defaults.el --- -*- lexical-binding: t -*-

(use-package emacs
  :straight (:type built-in)
  :custom
  (inhibit-startup-screen t))

(use-package elec-pair
  :straight (:type built-in)
  :ghook
  ('prog-mode-hook #'electric-pair-mode)
  ('org-mode-hook #'electric-pair-mode))

(use-package paren
  :straight (:type built-in)
  :custom
  (show-paren-delay 0)
  :config
  (show-paren-mode +1))

(use-package files
  :straight (:type built-in)
  :custom
  (make-backup-files nil)    ;; stop creating backup~ files
  (auto-save-default nil)    ;; stop creating #autosave# files
  (create-lockfiles nil)     ;; stop creating .# files
  (require-final-newline t)) ;; auto add newline at the end of file

(use-package saveplace
  :straight (:type built-in)
  :config
  (save-place-mode +1))

(provide 'kpav-defaults)
;;; kpav-defaults.el ends here
