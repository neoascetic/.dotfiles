(setq custom-file "~/.emacs.d/custom.el")
(setq make-backup-files nil)
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/saves/" t)))

(setq-default fill-column 80)

(menu-bar-mode -1)

(setq linum-format "%d ")
(global-linum-mode)

(setq isearch-forward t)
(setq savehist-additional-variables
      '(search-ring regexp-search-ring))
(savehist-mode t)

(setq vc-follow-symlinks t)

(modify-syntax-entry ?_ "w")

(xterm-mouse-mode t)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)

;; copy-paste to the global clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-selected-packages
      '(highlight-symbol
	rainbow-mode
	editorconfig
	clojure-mode
	git-gutter
	undo-tree
	company
	hl-sexp
	paredit
	goto-chg ; evil's dependency
	evil))
(setq package-load-list
      (mapcar (lambda (p) `(,p t))
	      package-selected-packages))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(package-install-selected-packages)

(setq show-paren-when-point-inside-paren t)

(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist `(("." . "~/.emacs.d/undo")))

(setq evil-want-C-u-scroll t)
(setq evil-toggle-key "")
(evil-mode)

(add-hook 'prog-mode-hook 'editorconfig-mode)
(add-hook 'prog-mode-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)

(add-hook 'lisp-mode-hook 'hl-sexp-mode)
(add-hook 'clojure-mode-hook 'hl-sexp-mode)
(add-hook 'emacs-lisp-mode-hook 'hl-sexp-mode)

(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'paredit-mode)
(add-hook
 'paredit-mode-hook
 (lambda ()
   (define-key paredit-mode-map (kbd "ESC <right>") 'paredit-backward-barf-sexp)
   (define-key paredit-mode-map (kbd "ESC <left>") 'paredit-forward-barf-sexp)
   (define-key paredit-mode-map (kbd "M-f") 'paredit-forward-slurp-sexp)
   (define-key paredit-mode-map (kbd "M-b") 'paredit-backward-slurp-sexp)))

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; my-own stupid theme
(let ((fg-gray "#606060")
      (bg-gray "#282828")
      (lg-gray "#2f2f2f")
      (purple  "#ff00ff")
      (yellow  "#ffff00")
      (blue    "#00ffff")
      (warning "#ff0000"))

  (custom-set-faces
    `(default ((t (:foreground ,fg-gray :background ,bg-gray))))
    `(cursor ((t (:background ,fg-gray))))
    `(fringe ((t (:background ,bg-gray))))
    `(mode-line ((t (:foreground ,bg-gray :background ,fg-gray))))
    `(region ((t (:background ,lg-gray))))
    `(secondary-selection ((t (:background ,lg-gray))))
    `(font-lock-builtin-face ((t (:foreground ,fg-gray))))
    `(font-lock-comment-face ((t (:foreground ,purple))))
    `(font-lock-function-name-face ((t (:foreground ,fg-gray))))
    `(font-lock-keyword-face ((t (:foreground ,fg-gray))))
    `(font-lock-string-face ((t (:foreground ,yellow))))
    `(font-lock-type-face ((t (:foreground ,fg-gray))))
    `(font-lock-constant-face ((t (:foreground ,blue))))
    `(font-lock-variable-name-face ((t (:foreground ,fg-gray))))
    `(minibuffer-prompt ((t (:foreground ,fg-gray :bold t))))
    `(font-lock-warning-face ((t (:foreground ,warning :bold t))))))
