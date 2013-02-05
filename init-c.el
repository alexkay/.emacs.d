(require 'cc-mode)
(add-to-list 'auto-mode-alist '("\\.cl$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cu$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(add-hook 'c-mode-common-hook (
    lambda ()
        (c-set-style "linux")
        (setq c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode nil)))

(provide 'init-c)
