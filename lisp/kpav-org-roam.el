;;; kpav-org-roam.el --- -*- lexical-binding: t -*-

(use-package org-roam
  :straight t
  :custom
  (org-roam-directory (file-truename "~/org/roam"))
  (org-roam-capture-templates
   '(("m" "main" plain "%?"
      :if-new (file+head "main/%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)
     ("p" "personal" plain "%?"
      :if-new (file+head "personal/%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)
     ("w" "work" plain "%?"
      :if-new (file+head "work/%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n")
      :unnarrowed t)
     ("j" "jira" plain "* TODO ${title}\nhttps://reifyhealth.atlassian.net/browse/${title}\n%?"
      :if-new (file+head "work/jira/%<%Y%m%d%H%M%S>-${slug}.org"
                         "#+title: ${title}\n#+filetags: :jira:\n")
      :unnarrowed t)))
  (org-roam-dailies-directory "daily/")
  (org-roam-dailies-capture-templates
   '(("d" "default" entry
      "* %?"
      :target (file+head "%<%Y-%m-%d>.org"
                         "#+title: %<%Y-%m-%d>\n"))))
  :ghook
  ('after-init-hook #'org-roam-db-autosync-mode)
  :general
  (base-leader-def
    :states '(normal visual)
    "n" '(:ignore :wk "notes")
    "ni" 'org-roam-node-insert
    "nf" 'org-roam-node-find
    "nc" 'org-roam-node-capture
    "nb" 'org-roam-buffer-toggle
    "nd" '(:ignore :wk "dailies")
    "ndt" 'org-roam-dailies-capture-today
    "ndT" 'org-roam-dailies-goto-today
    "ndy" 'org-roam-dailies-capture-yesterday
    "ndY" 'org-roam-dailies-goto-yesterday))

(use-package org-roam-ui
  :straight
  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t)
  (org-roam-ui-open-on-start t)
  :general
  (base-leader-def
    :states '(normal visual)
    "nu" 'org-roam-ui-mode))

(provide 'kpav-org-roam)
;;; kpav-org-roam.el ends here
