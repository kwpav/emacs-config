;;; kpav-windows-and-buffers.el --- -*- lexical-binding: t -*-

(use-package window
  :straight (:type built-in)
  :general
  (base-leader-def
   :states 'normal
   "b" '(:ignore t :wk "buffers")
   "w" '(:ignore t :wk "windows")
   ;; "bb" 'switch-to-buffer
   "bb" 'consult-buffer
   "bk" 'kill-buffer
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

(use-package eyebrowse
  :straight t
  :general
  (base-leader-def
    :states 'normal
    "w." 'eyebrowse-switch-to-window-config
    "w," 'eyebrowse-rename-window-config
    "w1" 'eyebrowse-switch-to-window-config-1
    "w2" 'eyebrowse-switch-to-window-config-2
    "w3" 'eyebrowse-switch-to-window-config-3
    "w4" 'eyebrowse-switch-to-window-config-4
    "w4" 'eyebrowse-switch-to-window-config-4
    "w5" 'eyebrowse-switch-to-window-config-5
    "w6" 'eyebrowse-switch-to-window-config-6
    "w7" 'eyebrowse-switch-to-window-config-7
    "w8" 'eyebrowse-switch-to-window-config-8
    "w9" 'eyebrowse-switch-to-window-config-9
    "w0" 'eyebrowse-switch-to-window-config-0)
  :config
  (eyebrowse-mode t))

(provide 'kpav-windows-and-buffers)
;;; kpav-windows-and-buffers.el ends here
