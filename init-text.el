;; Text and spelling.
(setq default-major-mode 'text-mode)
(setq ispell-program-name "aspell")
(ispell-change-dictionary "british" t)
(add-hook 'text-mode-hook 'flyspell-mode 1)
(add-hook 'python-mode-hook 'flyspell-prog-mode 1)

(provide 'init-text)