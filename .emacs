(setq custom-file "~/.emacs.d/custom.el")
(setq make-backup-files nil)
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/saves/" t)))

(setq-default fill-column 80)

(setq linum-format "%d ")
(global-linum-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(setq package-selected-packages
      '(rainbow-delimiters
	rainbow-mode
	editorconfig
	clojure-mode
	git-gutter
	undo-tree
	company
	hl-sexp
	evil))
(package-install-selected-packages)

(setq show-paren-when-point-inside-paren t)

(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist `(("." . "~/.emacs.d/undo")))

(setq evil-want-C-u-scroll t)
(setq evil-toggle-key "")
(evil-mode)

(global-git-gutter-mode)

(add-hook 'prog-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'editorconfig-mode)
(add-hook 'prog-mode-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook 'hl-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'hl-sexp-mode)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
