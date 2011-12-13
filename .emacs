;; From http://emacs-fu.blogspot.com/2008/12/using-packages-functions-only-if-they.html
(defmacro require-maybe (feature &optional file)
  "*Try to require FEATURE, but don't signal an error if `require' fails."
  `(require ,feature ,file 'noerror))

;; Load Gentoo-installed packages if available
(require-maybe 'site-gentoo)

;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; XEmacs has spoiled me
(global-set-key "\M-g" 'goto-line)

;; Turn on font-lock mode for Emacs
(cond ((not running-xemacs)
       (global-font-lock-mode t)))

;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)))

;; Add the hostname to the frame title
(setq frame-title-format `(, (user-login-name) "@", (system-name) ": " (buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Visual feedback on selections
(setq-default transient-mark-mode t)

;; Better newline behavior at end of files
(setq require-final-newline t
      next-line-add-newlines nil)

;; Turn off the startup message
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Use aspell instead of ispell
(setq-default ispell-program-name "/usr/bin/aspell")

;; Use unified context diffs
(setq diff-switches "-u")

;; Use SBCL for Lisp
(setq inferior-lisp-program "/usr/bin/env sbcl --noinform")

;; Don't bother me about my email address
(setq user-mail-address "dwc@pobox.com"
      query-user-mail-address nil)

;; Sensible defaults
(setq-default indent-tabs-mode nil
              indicate-empty-lines t)
(setq line-number-mode t
      column-number-mode t
      compilation-window-height 20)

(add-to-list 'load-path "~/.emacs.d")

;; Customizations
(setq custom-file "~/.emacs.d/customize")
(load-file custom-file)

;; Modes
(autoload 'tt-mode "tt-mode")
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))

(setq exec-path (cons (expand-file-name "~/.gems/bin") exec-path))
(autoload 'sass-mode "sass-mode")
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

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

(setq php-mode-force-pear t)

;; Start server for client usage
(server-start)
