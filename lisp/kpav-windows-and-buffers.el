;;; kpav-windows-and-buffers.el --- -*- lexical-binding: t -*-

(use-package window
  :straight (:type built-in)
  :general
  (base-leader-def
    :states 'normal
    "b" '(:ignore t :wk "buffers")
    "w" '(:ignore t :wk "windows")
    ;; "bb" 'switch-to-buffer
    ;; "bb" 'consult-buffer
    ;; "bk" 'kill-buffer
    "wo" 'split-window-horizontally
    "wu" 'split-window-vertically
    "wd" 'delete-window)
  :config
  (meow-leader-define-key
   '("wo" . split-window-horizontally)
   '("wu" . split-window-vertically)
   '("wd" . delete-window)))

(use-package windmove
  :straight (:type built-in)
  :general
  (base-leader-def
    :states 'normal
    "wh" 'windmove-left
    "wj" 'windmove-down
    "wk" 'windmove-up
    "wl" 'windmove-right)
  :init
  (meow-leader-define-key
   '("wh" . windmove-left)
   '("wj" . windmove-down)
   '("wk" . windmove-up)
   '("wl" . windmove-right))
  :config
  (windmove-default-keybindings))

(use-package ace-window
  :straight t
  :general
  ("M-o" 'ace-window)
  (base-leader-def
    :states 'normal
    "ww" 'ace-window)
  :custom
  ;; use home row instead of numbers
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :init
  (meow-leader-define-key
   '("ww" . ace-window)))

(use-package perspective
  :straight t
  :custom
  (persp-suppress-no-prefix-key-warning t)
  :general
  (base-leader-def
    :states 'normal
    "b`" 'persp-switch-by-number
    "bb" 'persp-switch-to-buffer
    "bk" 'persp-remove-buffer
    "bc" 'persp-kill
    "br" 'persp-rename
    "ba" 'persp-add-buffer
    "bA" 'persp-set-buffer
    "bi" 'persp-import
    "bn" 'persp-next
    "bp" 'persp-prev
    "bm" 'persp-merge
    "bu" 'persp-unmerge
    "bg" 'persp-add-buffer-to-frame-global
    "b C-s" 'persp-state-save
    "b C-l" 'persp-state-load
    "bs" 'persp-switch)
  :init
  (meow-leader-define-key
'("bb" . persp-switch-to-buffer)
   '("bk" . persp-remove-buffer)
   '("bc" . persp-kill)
   '("br" . persp-rename)
   '("ba" . persp-add-buffer)
   '("bA" . persp-set-buffer)
   '("bi" . persp-import)
   '("bn" . persp-next)
   '("bp" . persp-prev)
   '("bm" . persp-merge)
   '("bu" . persp-unmerge)
   '("bg" . persp-add-buffer-to-frame-global)
   '("b C-s" . persp-state-save)
   '("b C-l" . persp-state-load)
   '("bs" . persp-switch))
  :config
  (persp-mode +1))

(provide 'kpav-windows-and-buffers)
;;; kpav-windows-and-buffers.el ends here
