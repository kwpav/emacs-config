;;; kpav-system.el --- -*- lexical-binding: t -*-

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :straight t
  :config
  (exec-path-from-shell-initialize))

(use-package emacs
  :straight (:type built-in)
  :if (eq system-type 'darwin)
  :custom
  (mac-option-modifier 'meta)
  (mac-command-modifier 'super))

(provide 'kpav-system)
;;; kpav-system.el ends here
