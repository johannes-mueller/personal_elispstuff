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

(provide 'miscdefuns)
;;; miscdefuns.el ends here
