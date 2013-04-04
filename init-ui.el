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
(load-theme 'tango-dark t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(provide 'init-ui)
