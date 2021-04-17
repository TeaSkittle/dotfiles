;;; pkg.el
;;; Set up and install external packages seperately from init.el
;;;
;;; List of packages is at the end of this file

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
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Activate all the packages
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; Function to download all packages, doesn't force them on user
(defun download-packages ()
  (interactive)
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

;; Eanble certain packages at start
(rainbow-delimiters-mode)

;; List of packages
(setq package-list
      '(rainbow-delimiters fish-mode d-mode markdown-mode))

