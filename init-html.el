(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (local-set-key "\r" 'newline-and-indent)
            (setq indent-tabs-mode f)))

(provide 'init-html)
