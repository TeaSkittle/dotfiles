;;; pkg.el
;;; Set up and install external packages seperately from init.el

;; List of packages
(setq package-list
      '(rainbow-delimiters fish-mode d-mode markdown-mode
                           monokai-theme dashboard))

;; Setup package.el
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(unless package--initialized (package-initialize))

;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;; Activate all the packages
(package-initialize)

;; Fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Function to download all packages in package-list
;; may end up removing
(defun download-packages()
  (interactive)
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

;; Dashboard, will end up moving to another file
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Welcome to Ghost Emacs")
(setq dashboard-startup-banner "~/.emacs.d/lisp/logo.png")
