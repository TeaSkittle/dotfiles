;;; -*- lexical-binding: t -*-

;; ====================
;; Packages
;; ====================
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(unless package--initialized (package-initialize))

;; Fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; Install Packages
(dolist (package '(markdown-mode rainbow-delimiters racket-mode mood-line))
  (unless (package-installed-p package)
    (package-install package)))

;; Start rainbow-delimiters
(require 'rainbow-delimiters)

;; Ido Mode auto-completion
(ido-mode 1)
(ido-everywhere)
(setq ido-enable-flex-matching t)

;; Mood-line
(require 'mood-line)
(mood-line-mode)

;; ====================
;; Visuals
;; ====================
(load-theme 'wombat t)               ; Load a custom theme
(set-cursor-color "DeepPink")        ; Custom cursor color
(tool-bar-mode -1)                   ; Disable the tool bar
(setq inhibit-startup-screen t)      ; Disable splash screen
(show-paren-mode)                    ; Show matching parens
(setq show-paren-delay 0)            ; Paren match delay = 0
(global-display-line-numbers-mode t) ; Enable line numbering by default
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t) 

;; Customize Rainbow Delimiters
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray

;; ====================
;; Functionality
;; ====================
(define-key global-map [(insert)] nil)                ; Unbind Isnert Key
(global-set-key [mouse-3] 'mouse-popup-menubar-stuff) ; Gives right-click a context menu

;; Tab to 4 Space
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-width 4)


;; ====================
;; Miscellaneous
;; ====================
(savehist-mode t)                  ; Save minibuffer history over several sessions
(recentf-mode t)                   ; Builds a list of recently opened files
(defalias 'yes-or-no #'y-or-n-p)   ; y-or-n-p makes answering questions faster
(setq ring-bell-function 'ignore)  ; Disable bell sound
(setq require-final-newline t)     ; Add newline at end of file if not there
(delete-selection-mode 1)          ; Delete what is selected when typing
(delete-selection-mode 1)          ; Delete what is selected when typing
(setq auto-save-default nil)       ; Stop creating #autosave# files
(setq gc-cons-threshold 100000000) ; Garbage collection
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))

;; ====================
;; Files
;; ====================
(make-directory "/tmp/emacs/" t)
(setq backup-directory-alist '(("." . "/tmp/emacs/")))
(setq savehist-file "~/.emacs.d/savehist")
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
