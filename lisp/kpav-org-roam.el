;;; kpav-org-roam.el --- -*- lexical-binding: t -*-

(use-package org-roam
  :straight t
  :custom
  (org-roam-directory (file-truename "~/org/roam"))
  :ghook
  ('after-init-hook #'org-roam-db-autosync-mode)
  :general
  (base-leader-def
    :states '(normal visual)
    "r" '(:ignore :wk "roam")
    "ri" 'org-roam-node-insert
    "rf" 'org-roam-node-find
    "rc" 'org-roam-node-capture))

(provide 'kpav-org-roam)
;;; kpav-org-roam.el ends here
