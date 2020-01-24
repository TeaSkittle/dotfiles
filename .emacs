;;  _______         __  __                
;; |__   __|       |  \/  |               
;;    | | ___  __ _| \  / | __ _  ___ ___ 
;;    | |/ _ \/ _` | |\/| |/ _` |/ __/ __|
;;    | |  __/ (_| | |  | | (_| | (__\__ \
;;    |_|\___|\__,_|_|  |_|\__,_|\___|___/
;;
;;    TeaSkittle's emacs config

;; File located at: %appdata%\Roaming on Win10

;; =================
;;  Package Stuff
;; =================
(require 'package)
;; Disable custom comment stuff
(defun package--save-selected-packages (&rest opt) nil)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(setq package-list '(;; Modes
		     markdown-mode
		     rainbow-mode
		     rainbow-delimiters
		     ;; Themes
		     doom-themes
		     leuven-theme
		     parchment-theme
		     nofrils-acme-theme
		     monochrome-theme
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
;; Update packages if needed
(auto-package-update-maybe)

;; =============
;;    Ricing
;; =============
;; Set emacs theme
;; Themes I like manoj-dark, monochrome ,doom-one, leuven, parchment, nofrils-acme
(load-theme 'nofrils-acme t)
;; Remove certain things, make more TUI like
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
;; Remove splash screen, go straight to scratch buffer
(setq inhibit-splash-screen t)
;; Set line & column numbers
(global-linum-mode 1)
(setq column-number-mode t)
;; Adjust padding
(fringe-mode 10)
;; Colored parenthesis
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; Enable word wrapping, better readability
(global-visual-line-mode 1)

;; ============
;;   Editing
;; ============
;; Allow copy/paste with system clipboard
(setq x-select-enable-cliptbaord t)
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
