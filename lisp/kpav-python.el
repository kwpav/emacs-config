;;; kpav-python.el --- -*- lexical-binding: t -*-

(use-package pyenv-mode
  :straight t
  :ghook
  ('python-mode-hook #'pyenv-mode))

(use-package python
  :straight t
  :mode "\\.py\\'"
  :gfhook
  #'tree-sitter-mode
  #'tree-sitter-hl-mode
  #'eglot-ensure
  :ghook
  ('inferior-python-mode-hook #'eglot-ensure))

(provide 'kpav-python)
;;; kpav-python.el ends here
