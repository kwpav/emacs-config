;;; kpav-selectrum.el --- -*- lexical-binding: t -*-

(use-package vertico
  :straight t
  :init
  (vertico-mode +1))

(use-package orderless
  :straight t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))
  ;; Optional performance optimization
  ;; by highlighting only the visible candidates.
  ;; (setq orderless-skip-highlighting (lambda () selectrum-is-active))
  ;; (setq selectrum-highlight-candidates-function #'orderless-highlight-matches)
  :config
  ;; Persist history over Emacs restarts
  (savehist-mode +1))

(use-package ctrlf
  :straight t
  :general
  (evil-normal-state-map "/" 'ctrlf-forward-fuzzy-regexp)
  :init
  (ctrlf-mode +1))

(use-package marginalia
  :straight t
  :general
  ("M-A" 'marginalia-cycle)
  (:keymaps
   'minibuffer-local-map
   "M-A" 'marginalia-cycle)
  :init
  (marginalia-mode +1))

(use-package consult
  :straight t
  :general
  ;; C-c bindings (mode-specific-map)
  ("C-c h" 'consult-history)
  ("C-c m" 'consult-mode-command)
  ("C-c b" 'consult-bookmark)
  ("C-c k" 'consult-kmacro)
  ;; C-x bindings (ctl-x-map)
  ("C-x M-:" 'consult-complex-command)     ;; orig. repeat-complex-command
  ("C-x b" 'consult-buffer)                ;; orig. switch-to-buffer
  ("C-x 4 b" 'consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
  ("C-x 5 b" 'consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
  ;; Custom M-# bindings for fast register access
  ("M-#" 'consult-register-load)
  ("M-'" 'consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
  ("C-M-#" 'consult-register)
  ;; Other custom bindings
  ("M-y" 'consult-yank-pop)                ;; orig. yank-pop
  ("<help> a" 'consult-apropos)            ;; orig. apropos-command
  ;; M-g bindings (goto-map)
  ("M-g e" 'consult-compile-error)
  ("M-g f" 'consult-flycheck)              ;; Alternative: consult-flycheck
  ("M-g g" 'consult-goto-line)             ;; orig. goto-line
  ("M-g M-g" 'consult-goto-line)           ;; orig. goto-line
  ("M-g o" 'consult-outline)               ;; Alternative: consult-org-heading
  ("M-g m" 'consult-mark)
  ("M-g k" 'consult-global-mark)
  ("M-g i" 'consult-imenu)
  ("M-g I" 'consult-imenu-multi)
  ;; M-s bindings (search-map)
  ("M-s f" 'consult-find)
  ("M-s F" 'consult-locate)
  ("M-s g" 'consult-grep)
  ("M-s G" 'consult-git-grep)
  ("M-s r" 'consult-ripgrep)
  ("M-s l" 'consult-line)
  ("M-s L" 'consult-line-multi)
  ("M-s m" 'consult-multi-occur)
  ("M-s k" 'consult-keep-lines)
  ("M-s u" 'consult-focus-lines)
  ;; Isearch integration
  ("M-s e" 'consult-isearch)
  (:keymaps
   'isearch-mode-map
   "M-e" 'consult-isearch                 ;; orig. isearch-edit-string
   "M-s e" 'consult-isearch               ;; orig. isearch-edit-string
   "M-s l" 'consult-line                  ;; needed by consult-line to detect isearch
   "M-s L" 'consult-line-multi)           ;; needed by consult-line to detect isearch
  :init
  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  ;; (advice-add #'register-preview :override #'consult-register-window)

  ;; Optionally replace `completing-read-multiple' with an enhanced version.
  ;; (advice-add #'completing-read-multiple :override #'consult-completing;; -read-multiple)

  ;; Use Consult to select xref locations with preview
  ;; (setq xref-show-xrefs-function #'consult-xref
  ;;       xref-show-definitions-function #'consult-xref)
  :config
  ;; projectile
  ;; (setq consult-project-root-function #'projectile-project-root)
  ;; project.el
  (setq consult-project-root-function
        (lambda ()
          (when-let (project (project-current))
            (car (project-roots project))))))

(use-package embark
  :straight t
  :general
  ;; ("C-'" 'embark-act)
  ;; ("C-;" 'embark-dwim)
  ("C-h B" 'embark-bindings)
  ("C-;" 'embark-act)
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :straight t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(provide 'kpav-selectrum)
;;; kpav-selectrum.el ends here
