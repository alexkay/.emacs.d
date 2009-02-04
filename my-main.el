(server-start)

;; UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-default 'fill-column 80)
(setq visible-bell t)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(global-auto-revert-mode 1)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
(setq make-backup-files nil)
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
(color-theme-deep-blue)

;; ido
(require 'ido)
(ido-mode t)

;; Python hook.
(add-hook 'python-mode-hook (
    lambda () (local-set-key "\r" 'newline-and-indent)))

;; pymacs & ropemacs
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport 't)

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
(add-hook 'python-mode-hook 'flymake-mode)