;;; hunspellconf.el --- Settings for hunspell

;;; Commentary:

;; Nothing special

;;; Code:

(setq-default ispell-program-name "hunspell")

(eval-after-load "ispell"
        '(progn (defun ispell-get-coding-system () 'utf-8)))


(setq load-path (add-to-list 'load-path "~/.emacs.d/site-lisp/auto-dictionary-mode"))
(require 'auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

;;; hunspellconf.el ends here
