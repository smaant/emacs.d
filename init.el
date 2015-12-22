;;;;
;; Packages
;;;;

(setq load-prefer-newer t)

;; Define package repositories
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)
(setq message-log-max 16384)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)
(require 'diminish)

(require 'subr-x)
(require 'rx)
(require 'time-date)

(use-package dash
  :ensure t
  :demand t)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
;; (when (not package-archive-contents)
;;   (package-refresh-contents))

(defconst smaant-modules "modules/" "Path with all confgurations")

(eval-and-compile
  (push (expand-file-name "modules" user-emacs-directory) load-path))

(use-package smaant-navigation :load-path "modules")
(use-package smaant-dev :load-path "modules")

(provide 'init)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
;; (defvar my-packages
;;   '(dash
;;     ag

;;     ;; makes handling lisp expressions much, much easier
;;     ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
;;     paredit

;;     ;; key bindings and code colorization for Clojure
;;     ;; https://github.com/clojure-emacs/clojure-mode
;;     clojure-mode

;;     ;; extra syntax highlighting for clojure
;;     clojure-mode-extra-font-locking

;;     ;; integration with a Clojure REPL
;;     ;; https://github.com/clojure-emacs/cider
;;     cider

;;     ;; allow ido usage in as many contexts as possible. see
;;     ;; customizations/navigation.el line 23 for a description
;;     ;; of ido
;;     +ido-ubiquitous
;;     ido-hacks
;;     flx-ido
;;     +ido-vertical-mode

;;     ;; Enhances M-x to allow easier execution of commands. Provides
;;     ;; a filterable list of possible commands in the minibuffer
;;     ;; http://www.emacswiki.org/emacs/Smex
;;     +smex

;;     ;; project navigation
;;     projectile
;;     direx
;;     multiple-cursors

;;     ;; colorful parenthesis matching
;;     rainbow-delimiters

;;     ;; edit html tags like sexps
;;     tagedit

;;     ;; git integration
;;     magit
;;     diff-hl

;;     ;; fast navigation
;;     ace-jump-mode
;;     window-number
;;     window-numbering

;;     ;; themes
;;     leuven-theme

;;     highlight-symbol
;;     undo-tree
;;     which-key))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
;; (if (eq system-type 'darwin)
;;     (add-to-list 'my-packages 'exec-path-from-shell))

;; (dolist (p my-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
;; (add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
;; (load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
;(load "setup-js.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "purple3"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "forest green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "magenta4"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "DodgerBlue2"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "SlateBlue2"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "brown"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "DeepSkyBlue1"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "purple"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "SlateGray4")))))
