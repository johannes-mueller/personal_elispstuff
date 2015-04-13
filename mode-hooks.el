; Wenn ueberhaupt, dann C++
;
(setq auto-mode-alist
      (append '(("\\.h$"    . c++-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.tmpl$"    . html-helper-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.pl$"    . cperl-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("^/tmp/mutt-"    . post-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\.article\.[0-9]*"    . post-mode)) auto-mode-alist))

;(load-library "lilypond-mode.el")
;(setq auto-mode-alist
;      (append '(("\\.ly$" . LilyPond-mode) auto-mode-alist)))

;==========================
;My Text Settings
(add-hook 'text-mode-hook
          (lambda ()
            (turn-on-auto-fill)
            (setq fill-column 79)
	    (flyspell-mode 1)
	    (auto-complete-mode 1)
            ))

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (flyspell-mode 1)
	    (auto-complete-mode 1)
	    (pandoc-mode 1)
	    ))

(add-hook 'pandoc-mode-hook
	  (lambda ()
	    (flyspell-mode 1)
	    (auto-complete-mode 1)
	    (setq pandoc-data-dir "~/.lisp.gnu/pandoc")
	    (pandoc-load-default-settings)
	    ))

(add-hook 'post-mode-hook
	  (lambda ()
	    (setq fill-column 75)
	    (flyspell-mode 1)
	    (auto-complete-mode 1)
	    (setq flyspell-generic-check-word-p 'mail-mode-flyspell-verify)
	    (message "This is post-mode, doofie :-)")
))

;==========================
;My LaTeX Settings
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	   (load "texkram")
	   (flyspell-mode 1)
	   (auto-complete-mode 1)
	   (message "This is latex-mode, doofie :-)")
	   ))


(add-hook 'c++-mode-hook
	  (lambda ()
	    ; (load "my-kde-devel")
					;(load "kde-devel-emacs.elc")
	    (setq-default c-basic-offset 8 c-default-style "linux")
	    (setq-default tab-width 8 indent-tabs-mode nil)
	    (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
	    (imenu-add-to-menubar-index)
	    (c-set-offset 'innamespace 0)
	    )
)

(add-hook 'c-mode-hook
	  (lambda ()
	    ; (load "my-kde-devel")
	    )
)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-toggle-auto-hungry-state 1)
	    (setq c-basic-offset 8)
	    )
)

(add-hook 'cperl-mode-hook
	  (lambda ()
;	    (cperl-define-key 'delete 'delete-char)
	    (cperl-define-key 'backspace 'cperl-electric-backspace)
	    (cperl-define-key '[(control c) (control c)] 'comment-region)
	    (cperl-define-key '[(control c) (control u)] 'uncomment-region)
	    (setq cperl-indent-level 8)
	    )
)

(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "<C-backspace>") 'backward-kill-word)
	    ))

(add-hook 'dired-load-hook
	  (function (lambda ()
		      (load "dired-x")
		      (load "diredkram")
		      ;; Set dired-x global variables here.  For example:
		      ;; (setq dired-guess-shell-gnutar "gtar")
		      ;; (setq dired-x-hands-off-my-keys nil)
		      (linum-mode 0)
		      )))

(add-hook 'dired-mode-hook
	  (function (lambda ()
		      ;; Set dired-x buffer-local variables here.  For example:
		      ;; (setq dired-omit-files-p t)
		      (linum-mode 0)
		      )))

(add-hook 'magit-mode-hook
	  (lambda()
	  (setq ediff-diff-program "~/.lisp.gnu/ediff-diff.sh")
	  (linum-mode 0)
	  ))
