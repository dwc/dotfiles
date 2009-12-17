;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; Turn on font-lock mode for Emacs
(cond ((not running-xemacs)
       (global-font-lock-mode t)))

;; Add the hostname to the frame title
(setq frame-title-format `(, (user-login-name) "@", (system-name) ": " (buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Visual feedback on selections
(setq-default transient-mark-mode t)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)))

;; Turn off the startup message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Use aspell instead of ispell
(setq-default ispell-program-name "/usr/bin/aspell")

;; Use unified context diffs
(setq diff-switches "-u")

;; Sensible defaults
(setq line-number-mode t)
(setq column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq-default indicate-empty-lines t)
(setq compilation-window-height 20)
(setq user-mail-address "dwc@pobox.com")
(setq query-user-mail-address nil)

;; XEmacs has spoiled me
(global-set-key "\M-g" 'goto-line)

;; Customizations
(add-to-list 'load-path "~/.emacs.d")

(setq custom-file "~/.emacs.d/customize")
(load-file custom-file)

;; Modes
(autoload 'tt-mode "tt-mode")
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))

(defun ebuild-mode ()
  (shell-script-mode)
  (sh-set-shell "bash")
  (make-local-variable 'tab-width)
  (setq tab-width 8))
(add-to-list 'auto-mode-alist '("\\.ebuild$" . ebuild-mode))
(add-to-list 'auto-mode-alist '("\\.eclass$" . ebuild-mode))

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(defun my-mail-mode-hook ()
  (auto-fill-mode 1)
  (flyspell-mode 1))
(add-hook 'mail-mode-hook 'my-mail-mode-hook)

;; Use a better indentation style
(add-hook 'javascript-mode-hook
          '(lambda ()
             (c-set-style "java")))

(add-hook 'php-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)))

;; Load Gentoo-installed packages
(load "/usr/share/emacs/site-lisp/site-gentoo")

;; Start server for client usage
(server-start)
