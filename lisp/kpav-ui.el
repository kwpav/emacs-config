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

(use-package catppuccin-theme
  :straight t
  :custom
  (catppuccin-flavor 'mocha)
  ;; (catppuccin-flavor 'latte)
  ;; (catppuccin-flavor 'latte)
  ;; (catppuccin-flavor 'latte)
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package face-remap
  :straight (:type built-in)
  :after org
  :gfhook
  ('org-mode-hook #'variable-pitch-mode)
  :config
  ;; from https://zzamboni.org/post/beautifying-org-mode-in-emacs/
  (custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))))

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
