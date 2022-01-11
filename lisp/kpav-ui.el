;;; kpav-ui.el --- -*- lexical-binding: t -*-

(use-package faces
  :straight (:type built-in)
  :init
  ;; Main typeface
  (set-face-attribute 'default nil :family "Iosevka" :height 130)
  ;; Proportionately spaced typeface
  (set-face-attribute 'variable-pitch nil :family "EtBembo" :height 1.0)
  ;; Monospaced typeface
  (set-face-attribute 'fixed-pitch nil :family "Iosevka" :height 1.0))

(use-package modus-themes
  :straight t
  :init
  (setq modus-themes-mixed-fonts t
        modus-themes-bold-constructs t
        modus-themes-italic-constructs t
        modus-themes-intense-markup t
        modus-themes-completions 'opinionated
        modus-themes-subtle-line-numbers t
        modus-themes-syntax '(faint ;; alt-syntax
                                    )
        modus-themes-paren-match '(bold intense underline)
        modus-themes-region '(accented no-extend)
        modus-themes-mode-line '(borderless)
        ;; org specific settings
        modus-themes-org-blocks 'gray-background
        modus-themes-headings '((t . rainbow))
        modus-themes-scale-headings t)
  (modus-themes-load-themes)
  :config
  (modus-themes-load-vivendi))

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
  (doom-modeline-mode +1)
  :custom
  (doom-modeline-vcs-max-length 50)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (doom-modeline-modal-icon t)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-indent-info nil))

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
