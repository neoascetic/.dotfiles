(setq custom-file "~/.emacs.d/custom.el")
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq tab-always-indent 'complete)

(setq linum-format "%d ")
(global-linum-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(or (file-exists-p package-user-dir) (package-refresh-contents))
(setq package-selected-packages '(rainbow-delimiters clojure-mode company evil))
(package-install-selected-packages)

(evil-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
