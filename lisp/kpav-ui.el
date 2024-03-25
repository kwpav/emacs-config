;;; kpav-ui.el --- -*- lexical-binding: t -*-

(use-package faces
  :straight (:type built-in)
  :init
  ;; Main typeface
  (set-face-attribute 'default nil :family "Recursive Mn Lnr St" :height 130)
  ;; Proportionately spaced typeface
  (set-face-attribute 'variable-pitch nil :family "Recursive Sn Lnr St" :height 1.0)
  ;; Monospaced typeface
  (set-face-attribute 'fixed-pitch nil :family "Recursive Mn Lnr St" :height 1.0))

(use-package emacs
  :straight (:type built-in)
  :init
  (setq-default line-spacing 4))

(use-package ef-themes
  :straight t
  :custom
  (ef-themes-mixed-fonts t)
  (ef-themes-to-toggle 'ef-elea-light)
  :config
  ;; (ef-themes-select 'ef-maris-dark)
  (ef-themes-select 'ef-elea-dark))

(use-package face-remap
  :straight (:type built-in)
  :gfhook
  ('org-mode-hook #'variable-pitch-mode))

(use-package all-the-icons
  :straight t
  :defer t)

(use-package doom-modeline
  :straight t
  :demand t
  :preface
  :init
  (column-number-mode +1)
  :ghook
  'after-init-hook
  :custom
  (doom-modeline-icon nil)
  (doom-modeline-vcs-max-length 50)
  (doom-modeline-buffer-file-name-style 'auto)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-indent-info nil)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-modal-icon nil)
  (doom-modeline-persp-name t)
  (doom-modeline-workspace-name nil))

(use-package dashboard
  :straight t
  :custom
  ;; (dashboard-startup-banner 'logo)
  (dashboard-startup-banner (expand-file-name "img/gnu_color.png" user-emacs-directory))
  (dashboard-center-content t)
  (dashboard-projects-backend 'project-el)
  (dashboard-items '((recents . 5)
                     (bookmarks . 5)
                     (projects . 5)
                     (agenda . 5)))
  :config
  (dashboard-setup-startup-hook))

(use-package rainbow-delimiters
  :straight t
  :ghook
  ('prog-mode-hook #'rainbow-delimiters-mode))

(use-package frame
  :straight (:type built-in)
  :config
  (blink-cursor-mode -1))

(use-package hl-line
  :straight (:type built-in)
  :config
  (global-hl-line-mode +1))

(provide 'kpav-ui)
;;; kpav-ui.el ends here
