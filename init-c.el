(require 'cc-mode)
(setq auto-mode-alist (cons '("\\.cu$" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cl$" . c-mode) auto-mode-alist))
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(add-hook 'c-mode-common-hook (
    lambda ()
        (c-set-style "linux")
        (setq c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode nil)))

(provide 'init-c)