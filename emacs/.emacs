;;  _______         __  __                
;; |__   __|       |  \/  |               
;;    | | ___  __ _| \  / | __ _  ___ ___ 
;;    | |/ _ \/ _` | |\/| |/ _` |/ __/ __|
;;    | |  __/ (_| | |  | | (_| | (__\__ \
;;    |_|\___|\__,_|_|  |_|\__,_|\___|___/
;;

;; =================
;;  Package Stuff
;; =================
(require 'package)
(defun package--save-selected-packages (&rest opt) nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(setq package-list '(;; Modes
		     markdown-mode
		     rainbow-delimiters
		     neotree
		     ;; Themes
		     cyberpunk-theme
		     ;; Funciontality
		     auto-package-update
		     ))
;; Activate all the packages
(package-initialize)
;; Fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))
;; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
(auto-package-update-maybe)

;; =============
;;    Ricing
;; =============
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'tron-legacy t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
;; Remove splash screen, go straight to scratch buffer( set to t)
(setq inhibit-splash-screen nil)
;; Set line & column numbers
(global-linum-mode t)
(setq column-number-mode t)
;; Adjust padding
(fringe-mode 5)
;; Colored parenthesis
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; Enable word wrapping, better readability
(global-visual-line-mode 1)
;; tron-legacy-theme
(setq tron-legacy-vivid-cursor t)

;; ============
;;   Editing
;; ============
;; Disable insert key crap
(global-unset-key(kbd"<insert>"))
;; Allow copy/paste with system clipboard
(setq x-select-enable-cliptbaord t)
;; highlight line
(global-hl-line-mode 1)
(set-face-background 'hl-line "midnight blue")
;; Enable selection highlight w/ C-SPC
(setq transient-mark-mode t)
;; Disable bell
(setq ring-bell-function 'ignore)
;; No backups or auto-saves
(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil)
;; Add newline at end of file if not there
(setq require-final-newline t)
;; Delete what is selected when typing
(delete-selection-mode 1)
;; neotree
(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'ascci))

