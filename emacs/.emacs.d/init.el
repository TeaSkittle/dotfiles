; init.el
; No external packages, just base emacs and elisp

; Useful defaults
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
	   #'linum-mode))                   ; Show line numbers in programming modes
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)               ; Make emacs startup faster

; Visuals, no custom theme loaded
(set-background-color "black")              ; Set background color to black
(set-foreground-color "white")              ; Set foreground color to white
(global-hl-line-mode 1)                     ; Enable hl-line.el
(set-face-foreground 'highlight nil)        ; Keep foreground color
(set-cursor-color "DeepPink")               ; Cursor color
(set-face-background `hl-line              
		    "MidnightBlue")         ; Current line color
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))                     ; Disable toolbar

; Custom functions
(defun reload-config ()
  (interactive)
  (load-file (concat user-emacs-directory "~/.emacs.d/init.el")))

; Custom keybinds
(global-unset-key (kbd "<insert>"))             ; Disable insert key
(global-set-key [?\C-h] 'delete-backward-char)  ; Set C-h to backwards delete
(global-set-key [?\C-x ?h] 'help-command)       ; Change help to C-x h
(global-set-key (kbd "C-S-h")
		'backward-kill-word)            ; Delete backwards word
