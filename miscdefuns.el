(defun bigframe()
  (interactive)
  (set-frame-size (selected-frame()) 111 51)
)

(defun normalframe()
  (interactive)
  (set-frame-size (selected-frame()) 80 51)
)

(defun toggle-frame-size()
  (interactive)
  (if (= (frame-width(selected-frame())) 80)
    (progn
      (bigframe)
      )
    (progn
      (normalframe))
    )
  )

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))


(defun johmue/detect-ws-backward ()
  "Delete whitespace until the previous non whitespace."
  (skip-chars-backward " \t\r\n")
  )

(defun johmue/detect-ws-forward ()
  "Delete whitespace until the previous non whitespace."
  (skip-chars-forward " \t\r\n")
  )

(defun johmue/delete-whitespace-impl (fn)
  (let ((here (point)))
    (funcall fn)
    (if (/= (point) here)
	(delete-region (point) here))
    ))

(defun johmue/delete-whitespace-backward ()
  (interactive)
  (johmue/delete-whitespace-impl 'johmue/detect-ws-backward)
)

(defun johmue/delete-whitespace-forward ()
  (interactive)
  (johmue/delete-whitespace-impl 'johmue/detect-ws-forward)
)

(defun johmue/jump-whitespace-backward ()
  (interactive)
  (johmue/detect-ws-backward)
)

(defun johmue/jump-whitespace-forward ()
  (interactive)
  (johmue/detect-ws-forward)
)

(defun johmue/mark-current-line ()
  (interactive)
  (beginning-of-line)
  (set-mark (line-end-position))
  )

(defun johmue/eval-this-line ()
  (interactive)
  (save-excursion
    (eval-region (line-beginning-position) (line-end-position))
    )
  )

(defun johmue/comment-current-line ()
  (interactive)
  (save-excursion
    (comment-region (line-beginning-position) (line-end-position))
    )
  )

(defun johmue/uncomment-current-line ()
  (interactive)
  (save-excursion
    (uncomment-region (line-beginning-position) (line-end-position))
    )
  )

(defun johmue/scroll-other-window-one-down ()
  (interactive)
  (scroll-other-window 1)
  )

(defun johmue/scroll-other-window-one-up ()
  (interactive)
  (scroll-other-window-down 1)
  )


(defun johmue/make ()
  (interactive)
  (compile "make")
  )


(defun johmue/jump-to-project ()
  (dired ".")
  (projectile-vc)
  (other-window 1)
  (setq projectile-mode-line-function '(lambda () (format " <%s>" (projectile-project-name))))
)

(defun johmue/switch-to-ipython ()
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "-i --simple-prompt"
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
)

(defun johmue/switch-to-python ()
  (setq
   python-shell-interpreter "python"
   python-shell-interpreter-args "-i"
   python-shell-prompt-regexp ""
   python-shell-prompt-output-regexp ""
   python-shell-completion-setup-code ""
   python-shell-completion-module-string-code ""
   python-shell-completion-string-code "")
  )

(require 'f)

(defun johmue/switch-to-ipython-if-possible ()
  (interactive)
  (let ((ipython-executable-path
	 (concat
	  (file-name-as-directory
	   (if (file-accessible-directory-p (expand-file-name conda-env-current-name))
	       (expand-file-name conda-env-current-name)
	     (concat (file-name-as-directory
		      (expand-file-name (conda-env-default-location)))
		     conda-env-current-name)))
	   (file-name-as-directory conda-env-executables-dir)
	   "ipython")))
    (message "path: %s" ipython-executable-path)
    (if (f-executable? ipython-executable-path)
	(johmue/switch-to-ipython)
      (johmue/switch-to-python))))



(defvar johmue/pytest-arg-hist nil)

(defun johmue/run-pytest (args)
  (interactive
   (list
    (read-from-minibuffer "additional args for pytest: "
			  (car johmue/pytest-arg-hist) nil nil
			  'johmue/pytest-arg-hist)))
  ;(message "command is '%s'" (concat "pytest -v " args))
  (compile (concat "pytest -v " args))
  )


(provide 'miscdefuns)

;;; miscdefuns.el ends here
