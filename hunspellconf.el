
(setq-default ispell-program-name "hunspell")
(setq ispell-dictionary-alist nil)
(setq ispell-dictionary-base-alist nil)

(eval-after-load "ispell"
        '(progn (defun ispell-get-coding-system () 'utf-8)))

(setq ispell-local-dictionary-alist
      '(
	("deutsch"    "[[:alpha:]]" "[^[:alpha:]]" "[\"]" nil ("-d" "de_DE") nil utf-8)
	("esperanto" "[[:alpha:]]" "[^[:alpha:]]" "[\"]" nil ("-d" "eo")    nil utf-8)
	("british"   "" "" "[']" t ("-d" "en_GB") nil utf-8)
	("american"  "" "" "[']" t ("-d" "en_US") nil utf-8)
	("francais"  "" "" "[']" t ("-d" "fr_FR") nil utf-8)
	("svenska"   "" "" "[']" t ("-d" "sv_SE") nil utf-8)
	)
      )

(setq ispell-dictionary "deutsch")

(defun deutsch()
  (interactive)
  (ispell-change-dictionary "deutsch")
)

(defun englisch()
  (interactive)
  (ispell-change-dictionary "british")
)

(defun esperanto()
  (interactive)
  (ispell-change-dictionary "esperanto")
)

(defun franzoesisch()
  (interactive)
  (ispell-change-dictionary "francais")
)

(defun schwedish()
  (interactive)
  (ispell-change-dictionary "svenska")
)
