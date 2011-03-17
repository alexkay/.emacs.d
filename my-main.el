;; UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-default 'fill-column 80)
(setq visible-bell t)
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(line-number-mode 1)
(column-number-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(global-auto-revert-mode 1)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(setq make-backup-files nil)
(set-scroll-bar-mode 'right)
(global-set-key "\M-n" (lambda () (interactive) (scroll-up 1)))
(global-set-key "\M-p" (lambda () (interactive) (scroll-down 1)))
(add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
(defun custom-goto-match-beginning ()
  "Use with isearch hook to end search at first char of match."
  (when isearch-forward (goto-char isearch-other-end)))
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

;; Text and spelling.
(setq default-major-mode 'text-mode)
(setq ispell-program-name "aspell")
(ispell-change-dictionary "british" t)
(add-hook 'text-mode-hook 'flyspell-mode 1)
(add-hook 'python-mode-hook 'flyspell-prog-mode 1)

;; colours
(require 'color-theme)
(color-theme-initialize)
(defun apply-color-theme (frame)
	(select-frame frame)
	(if (window-system frame)
		(color-theme-deep-blue)
		(color-theme-arjen)))
(setq color-theme-is-cumulative nil)
(setq color-theme-is-global nil)
(add-hook 'after-make-frame-functions 'apply-color-theme)

;; ido
(require 'ido)
(ido-mode t)

;; C
(require 'cc-mode)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(add-hook 'c-mode-common-hook (
    lambda ()
        (c-set-style "linux")
        (setq c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)))

;; Vala
(require 'vala-mode)
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;; Python hook.
(add-hook 'python-mode-hook (
    lambda () (local-set-key "\r" 'newline-and-indent)))

;; pymacs & ropemacs
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)

;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport 't)

;; Django templates.
(require 'django-html-mode)

;; psvn
(require 'psvn)

;; pylint
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))
;(add-hook 'python-mode-hook 'flymake-mode)

;; csharp-mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
  (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;; haskell-mode
(load "haskell-mode/haskell-site-file")
(setq haskell-font-lock-symbols 'unicode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; Perl
(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tt$" . html-mode) auto-mode-alist))
(add-hook 'cperl-mode-hook (
    lambda () (local-set-key "\r" 'newline-and-indent)))
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 0
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

;; Erlang
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.6.3/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)
