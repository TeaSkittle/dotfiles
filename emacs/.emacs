;; Void Emacs
;; based off sanemacs
;; started editing on 9-10-2020
;; no extra packages, just base emacs
;;
;; TODO: add custom init.el, move stuff to void emacs folder

;; Disable menu-bar, tool-bar, and scroll-bar.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Useful defaults
(setq initial-scratch-message "")          ; Make *scratch* buffer blank
(setq-default frame-title-format '("%b"))  ; Make window title the buffer name
(setq ring-bell-function 'ignore)          ; Disable bell sound
(fset 'yes-or-no-p 'y-or-n-p)              ; y-or-n-p makes answering questions faster
(show-paren-mode 1)                        ; Show closing parens by default
(setq linum-format "%4d ")                 ; Line number format
(display-time-mode 1)                      ; Show current time in mode-line
(setq initial-scratch-message "")          ; Make *scratch* buffer blank
(setq-default frame-title-format '("%b"))  ; Make window title the buffer name
(setq ring-bell-function 'ignore)          ; Disable bell sound
(fset 'yes-or-no-p 'y-or-n-p)              ; y-or-n-p makes answering questions faster
(show-paren-mode 1)                        ; Show closing parens by default
(setq linum-format "%4d ")                 ; Line number format
(setq require-final-newline t)             ; Add newline at end of file if not there
(delete-selection-mode 1)                  ; Delete what is selected when typing
(global-set-key [mouse-3]                  ; Gives right-click a context menu
		'mouse-popup-menubar-stuff) 
(add-hook 'prog-mode-hook                  ; Show line numbers in programming modes
	  (if (and (fboundp 'display-line-numbers-mode) (display-graphic-p))
              #'display-line-numbers-mode #'linum-mode))

;; Visuals, no custom theme loaded
(set-background-color "black")             ; Set background color to black
(set-foreground-color "white")             ; Set foreground color to white
(global-hl-line-mode 1)                    ; Enable hl-line.el
(set-face-foreground 'highlight nil)       ; Keep foreground color
(set-cursor-color "DeepPink")              ; Cursor color
(set-face-background `hl-line              ; Current line color
		     "MidnightBlue")

;; Custom splash screen image
(setq fancy-splash-image "~/splash.jpg")

;; function to relod config
(defun reload-config ()
  (interactive)
  (load-file (concat user-emacs-directory "~/.emacs")))

;; Custom keybinds
(global-unset-key (kbd "<insert>"))
