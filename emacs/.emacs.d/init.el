;;; No external packages, just base emacs and elisp

;; Useful defaults
(setq initial-scratch-message "")           ; Make *scratch* buffer blank
(setq-default frame-title-format '("%b"))   ; Make window title the buffer name
(setq ring-bell-function 'ignore)           ; Disable bell sound
(fset 'yes-or-no-p 'y-or-n-p)               ; y-or-n-p makes answering questions faster
(show-paren-mode 1)                         ; Show closing parens by default
(setq linum-format "%4d ")                  ; Line number format
(display-time-mode 1)                       ; Show current time in mode-line
(setq initial-scratch-message "")           ; Make *scratch* buffer blank
(setq-default frame-title-format '("%b"))   ; Make window title the buffer name
(setq ring-bell-function 'ignore)           ; Disable bell sound
(fset 'yes-or-no-p 'y-or-n-p)               ; y-or-n-p makes answering questions faster
(show-paren-mode 1)                         ; Show closing parens by default
(setq linum-format "%4d ")                  ; Line number format
(setq require-final-newline t)              ; Add newline at end of file if not there
(delete-selection-mode 1)                   ; Delete what is selected when typing
(global-set-key [mouse-3]                  
                'mouse-popup-menubar-stuff) ; Gives right-click a context menu 
(add-hook 'prog-mode-hook                   
	  (if (and (fboundp 'display-line-numbers-mode)
		   (display-graphic-p))
	      #'display-line-numbers-mode
	    #'linum-mode))                      ; Show line numbers in programming modes
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)               ; Make emacs startup faster
(setq read-process-output-max
              (* 1024 1024))                ; 1mb
(setq-default tab-width 4
              indent-tabs-mode nil)         ; Set tab to 4 spaces

;; Visuals
(global-hl-line-mode 1)                     ; Enable hl-line.el
(set-face-foreground 'highlight nil)        ; Keep foreground color
(blink-cursor-mode 0)                       ; Cursor blinking
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))                     ; Disable toolbar
;; Colors
(set-background-color "#062329")
(set-foreground-color "#ffffff")
(set-face-background `hl-line "#0b3335")
(set-cursor-color "DeepPink")
;; Modeline
(set-face-attribute 'mode-line nil
                    :background "#eee8d5"
                    :foreground "#072d40")
(set-face-attribute 'mode-line-inactive nil
                    :background "#fdf6e3"
                    :foreground "#93a1a1")

;; Custom functions
(defun reload-config ()
  (interactive)
  (load-file (concat user-emacs-directory "~/.emacs.d/init.el")))

;; Custom keybinds
(global-unset-key (kbd "<insert>"))         ; Disable insert key

;; Load other elisp files
(add-to-list 'load-path "~/.emacs.d/lisp")
(setq custom-file "~/.emacs.d/lisp/dump.el")
(load custom-file)
(load "pkg.el")

;; Spectrwm fix
(setq frame-resize-pixelwise t)

