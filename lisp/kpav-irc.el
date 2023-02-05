;;; kpav-irc.el --- -*- lexical-binding: t -*-

(use-package erc
  :straight (:type built-in)
  :defer t
  :custom
  (erc-server "irc.libera.chat")
  (erc-nick "kpav")
  (erc-autojoin-channels-alist  '(("irc.libera.chat" "#emacs" "#clojure" "#sr.ht" "#archlinux" "#stumpwm"))))

(provide 'kpav-irc)
;;; kpav-irc.el ends here
