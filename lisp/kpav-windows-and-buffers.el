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
   "wd" 'delete-window))

(use-package windmove
  :straight (:type built-in)
  :general
  (base-leader-def
   :states 'normal
   "wh" 'windmove-left
   "wj" 'windmove-down
   "wk" 'windmove-up
   "wl" 'windmove-right)
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
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package perspective
  :straight t
  :general
  (base-leader-def
    :states 'normal
    "bb" 'persp-switch-to-buffer*
    "bk" 'persp-kill-buffer*)
  :config
  (persp-mode +1))

(provide 'kpav-windows-and-buffers)
;;; kpav-windows-and-buffers.el ends here
