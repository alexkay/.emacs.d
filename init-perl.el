(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tt$" . html-mode) auto-mode-alist))
(add-hook 'cperl-mode-hook (
    lambda () (local-set-key "\r" 'newline-and-indent)))
(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-continued-statement-offset 0
      cperl-indent-parens-as-block t
      cperl-tab-always-indent t)

(provide 'init-perl)
