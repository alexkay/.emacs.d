(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'turn-on-pandoc)

(provide 'init-markdown)