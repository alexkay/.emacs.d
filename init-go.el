(require 'go-mode-autoloads)
(add-hook 'before-save-hook #'gofmt-before-save)

(provide 'init-go)
