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
  (setq-default line-spacing 3))

(use-package modus-themes
  :straight t
  :custom
  (modus-themes-disable-other-themes t)
  ;; Allow sans and mono fonts in org mode
  (modus-themes-mixed-fonts t)
  ;; bold and italic fonts
  (modus-themes-bold-constructs t)
  (modus-themes-italic-constructs t)
  (modus-themes-prompts '(italic bold))
  ;; auto completion styles
  (modus-themes-completions '((matches . (extrabold background intense underline))
                              (selection . (semibold background intense accented))
                              (popup . (accented))))
  ;; gray bg for org mode src blocks
  (modus-themes-org-blocks 'gray-background)
  ;; make org mode headings different sizes
  (modus-themes-headings '((1 . (1.4))
                           (2 . (1.2))
                           (3 . (1.1))
                           (t . (semibold))))
  :config
  ;; make the colors more faint
  (setq modus-themes-common-palette-overrides modus-themes-preset-overrides-faint)
  (load-theme 'modus-vivendi))

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

(use-package prism
  :straight t
  :config
  (setq prism-num-faces 16)
  ;; (setq prism-parens +1)
  (prism-set-colors :num 16
    :desaturations  (cl-loop for i from 0 below 16
                          collect (* i 5))
    :lightens (cl-loop for i from 0 below 16
                          collect (* i 2.5))
    :comments-fn
    (lambda (color)
      (prism-blend color
                   (face-attribute 'font-lock-comment-face :foreground) 0.25))
    :strings-fn
    (lambda (color)
      (prism-blend color "white" 0.85))
    :colors (modus-themes-with-colors
              (list fg-main
                    magenta
                    cyan-cooler
                    magenta-cooler
                    blue
                    magenta-warmer
                    cyan-warmer
                    red-cooler
                    green
                    fg-main
                    cyan
                    yellow
                    blue-warmer
                    red-warmer
                    green-cooler
                    yellow-faint))))

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
