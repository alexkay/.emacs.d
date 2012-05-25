;; Python hook.
(add-hook 'python-mode-hook (
    lambda () (local-set-key "\r" 'newline-and-indent)))

;; pymacs & ropemacs
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)

;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport 't)

;; Django templates.
(require 'django-html-mode)

;; pylint
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "epylint" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))
;(add-hook 'python-mode-hook 'flymake-mode)

;; http://code.naeseth.com/python/libjump/
(defun better-current-word ()
  "Similar to current-word, but include dot and don't include dash.  This is
   better suited to non-LISP programming."
  (save-excursion
    (re-search-backward "[^A-Za-z0-9_\\.]")
    (if (re-search-forward "\\([A-Za-z0-9_\\.]+\\)" nil t)
      (match-string 1) "")))

(defun read-word-target (prompt history-symbol)
  (let ((default (better-current-word)))
    (read-from-minibuffer prompt default nil nil history-symbol)))

(defun erics-libjump (query)
  (interactive (list (read-word-target "Python stdlib search: " nil)))
  (call-process "firefox" nil nil nil
    (concat "http://code.naeseth.com/python/libjump/search?q=" query)))
(add-hook 'python-mode-hook
  (function (lambda () (local-set-key "\C-hp" 'erics-libjump))))

(provide 'init-python)