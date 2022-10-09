;;; kpav-python.el --- -*- lexical-binding: t -*-

(use-package pyenv-mode
  :straight t
  :ghook
  ('python-mode-hook #'pyenv-mode))

(use-package python
  :straight (:type built-in)
  :defer t
  :ghook
  ('python-mode-hook #'tree-sitter-mode)
  ('python-mode-hook #'eglot-ensure)
  ('inferior-python-mode-hook #'eglot-ensure))

(provide 'kpav-python)
;;; kpav-python.el ends here
