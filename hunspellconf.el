(setq-default ispell-program-name "hunspell")

(eval-after-load "ispell"
        '(progn (defun ispell-get-coding-system () 'utf-8)))


;(require 'auto-dictionary)
;(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))


