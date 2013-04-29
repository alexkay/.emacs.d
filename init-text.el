;; Text and spelling.
(setq default-major-mode 'text-mode)
(setq ispell-program-name "aspell")
(ispell-change-dictionary "british" t)
(add-hook 'text-mode-hook 'flyspell-mode 1)
(add-hook 'python-mode-hook 'flyspell-prog-mode 1)
(set-face-attribute 'default nil :height  110)
(setq-default show-trailing-whitespace t)

(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)
(electric-indent-mode +1)
(electric-pair-mode +1)

(provide 'init-text)
