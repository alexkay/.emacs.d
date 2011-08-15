;; haskell-mode
(load "haskell-mode/haskell-site-file")
(setq haskell-font-lock-symbols 'unicode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'init-haskell)