;;; Personal configuration -*- lexical-binding: t -*-
;;; Based off of:
;;;  https://github.com/susam/emfy
;;;  https://emacs.amodernist.com/

;; Add the NonGNU ELPA package archive
(require 'package)
(add-to-list 'package-archives  '("nongnu" . "https://elpa.nongnu.org/nongnu/"))

;; Install packages.
(dolist (package '(markdown-mode rainbow-delimiters racket-mode))
  (unless (package-installed-p package)
    (package-install package)))

;; Load a custom theme
(load-theme 'wombat t)

;; Custom cursor color
(set-cursor-color "DeepPink")

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable splash screen
(setq inhibit-startup-screen t)

;; Unbind Isnert Key
(define-key global-map [(insert)] nil)

;; Tab to 4 Space
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)

;; Gives right-click a context menu
(global-set-key [mouse-3] 'mouse-popup-menubar-stuff)

;; Enable line numbering by default
(global-display-line-numbers-mode t)

;; Enable column number in mode-line
(column-number-mode)

;; Ido Mode auto-completion
(ido-mode 1)
(ido-everywhere)
(setq ido-enable-flex-matching t)

;; Highlight matching pairs of parentheses.
(setq show-paren-delay 0)
(show-paren-mode)

;; Customize Rainbow Delimiters
(require 'rainbow-delimiters)

;; Customize Rainbow Delimiters.
(require 'rainbow-delimiters)
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray

;; Write backups to separate directory
(make-directory "~/.tmp/emacs/auto-save/" t)
(setq backup-directory-alist '(("." . "~/.tmp/emacs/backup/")))

;; Miscellaneous options
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)   ; y-or-n-p makes answering questions faster
(setq ring-bell-function 'ignore)  ; Disable bell sound
(setq require-final-newline t)     ; Add newline at end of file if not there
(delete-selection-mode 1)          ; Delete what is selected when typing
(delete-selection-mode 1)          ; Delete what is selected when typing
(setq auto-save-default nil)       ; Stop creating #autosave# files
(setq gc-cons-threshold 100000000) ; Garbage collection

;; Store automatic customization options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Start server
(require 'server)
(unless (server-running-p)
  (server-start))
