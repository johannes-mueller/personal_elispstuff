; Wenn ueberhaupt, dann C++
;
(setq auto-mode-alist
      (append '(("\\.h$"    . c++-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.tmpl$"    . html-helper-mode)) auto-mode-alist))
(setq auto-mode-alist
      (append '(("\\.pl$"    . cperl-mode)) auto-mode-alist))

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
            ))

(add-hook 'markdown-mode-hook
	  (lambda ()
	    (flyspell-mode 1)
	    (pandoc-mode 1)
	    ))

(add-hook 'pandoc-mode-hook
	  (lambda ()
	    (flyspell-mode 1)
	    (setq pandoc-data-dir "~/.lisp.gnu/pandoc")
	    (pandoc-load-default-settings)
	    ))

;==========================
;My LaTeX Settings
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	   (load "texkram")
	   (flyspell-mode 1)
	   (rainbow-delimiters-mode)
	   (message "This is latex-mode, doofie :-)")
	   ))

(add-hook 'prog-mode-hook #'yas-minor-mode)

(add-hook 'c++-mode-hook
	  (lambda ()
	    (c-set-offset 'innamespace 0)
            (message "c++-mode-hook")
	    )
)
;(add-hook 'c++-mode-hook #'lsp)

(add-hook 'c-mode-hook
	  (lambda ()
	    (message "c-mode-hook")
	    ; (load "my-kde-devel")
	    )
)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-toggle-auto-hungry-state nil)
	    (c-toggle-auto-newline nil)
	    (require 'dtrt-indent)
	    (dtrt-indent-mode t)
	    (setq-default c-basic-offset 8 c-default-style "linux")
	    (setq-default c-indentation-style "linux")
	    (setq-default tab-width 8 indent-tabs-mode t)
	    (setq indent-tabs-mode t)
	    (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
	    (rtags-start-process-unless-running)
	    ;(irony-mode)
	    (rainbow-delimiters-mode)
            (message "c-common-mode-hook")
	    )
)
(add-hook 'c-mode-common-hook #'rtags-xref-enable)
;(add-hook 'c-mode-common-hook #'lsp)


(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

(add-hook 'cperl-mode-hook
	  (lambda ()
;	    (cperl-define-key 'delete 'delete-char)
	    (cperl-define-key 'backspace 'cperl-electric-backspace)
	    (cperl-define-key '[(control c) (control c)] 'comment-region)
	    (cperl-define-key '[(control c) (control u)] 'uncomment-region)
	   (rainbow-delimiters-mode)
	    (setq cperl-indent-level 8)
	    )
)

(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "<C-backspace>") 'backward-kill-word)
	    (define-key python-mode-map [M-f12] 'python-pytest-popup)
	    (pycoverage-mode)
	    (rainbow-delimiters-mode)
	    ;(setq jedi:complete-on-dot t)
	    (message "python-mode called")
	    ))

(add-hook 'window-configuration-change-hook 'johmue/auto-activate-virtualenv)
(add-hook 'focus-in-hook 'johmue/auto-activate-virtualenv)

(add-hook 'python-pytest-finished-hook 'pycoverage-refresh)

(add-hook 'conda-postactivate-hook 'johmue/switch-to-ipython-if-possible)
(add-hook 'conda-postdeactivate-hook 'johmue/switch-to-python)

;; (require 'lsp-jedi)
;; (require 'lsp-pyright)
;; (with-eval-after-load "lsp-mode"
;;   (add-to-list 'lsp-disabled-clients 'pyls)
;;   (add-to-list 'lsp-enabled-clients 'pyright))

(add-hook 'python-mode-hook #'lsp)
(setq lsp-pyls-configuration-sources ["flake8"])

(add-hook 'rust-mode-hook #'lsp)
;(add-hook 'rust-mode-hook #'racer-mode)
;(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(add-hook 'rust-mode-hook
	  (lambda ()
	    (cargo-minor-mode)
	    (rainbow-delimiters-mode)
	    (setq indent-tabs-mode nil)
	    (fci-mode)
	    (setq fci-rule-column 100)
	   ; (setq flychek-checker 'cargo)
	    ))

(add-hook 'rustic-mode-hook
	  (lambda ()
	    (cargo-minor-mode)
	    (rainbow-delimiters-mode)
	    (setq indent-tabs-mode nil)
	    (fci-mode)
	    (setq fci-rule-column 100)
	   ; (setq flychek-checker 'cargo)
	    ))

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

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

(add-hook 'term-mode-hook
	  (lambda()
	    (term-set-escape-char ?\C-x)
	    ))

(require 'sql-indent)

(add-hook 'sql-mode-hook
	  (lambda()
	    (sqlind-minor-mode)
	    (rainbow-delimiters-mode)
	    (setq sqlind-basic-offset 8)
	    ))

(defvar my-sql-indentation-offsets-alist
  `((defun-start 0)
   ,@sqlind-default-indentation-offsets-alist))

(add-hook 'sqlind-minor-mode-hook
    (lambda ()
       (setq sqlind-indentation-offsets-alist
             my-sql-indentation-offsets-alist)))


(projectile-register-project-type 'waf '("waf")
                  :compile "LANG=C ./waf build"
                  :test "LANG=C ./waf test")

(projectile-register-project-type 'rust-cargo '("Cargo.toml")
                                  :compile "cargo build"
                                  :test "RUST_BACKTRACE=1 cargo test --tests -- --nocapture")

(projectile-register-project-type 'python-pytest '("pytest.ini")
                                  :compile "pytest -v"
                                  :test "pytest -v")

(add-hook 'elixir-mode-hook
	  (lambda ()
	    (add-to-list 'elixir-mode-hook
			 (defun auto-activate-ruby-end-mode-for-elixir-mode ()
			   (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
				"\\(?:^\\|\\s-+\\)\\(?:do\\)")
			   (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
			   (ruby-end-mode +1)))))

(add-hook 'elixir-mode-hook #'lsp)

;;; mode-hooks.el ends here
