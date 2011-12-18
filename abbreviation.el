;; enhanced abbreviation behaviour
;;
(setq-default abbrev-mode t)
(if (not (file-exists-p "~/.abbrev_defs"))
    (write-abbrev-file "~/.abbrev_defs"))
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)
(defun expand-abbrev-or-dabbrev()
  (interactive)
  (if (not (expand-abbrev))
      (progn
        (dabbrev-expand nil))))
(setq-default abbrev-mode t)
