(defun copy-for-paste()
  (interactive)
  (point-to-register 9)
  (setq start-point (point))
  (exchange-point-and-mark)
  (setq end-point (point))
  (setq length-of-text (abs (- end-point start-point)))
  (copy-to-register 8 start-point end-point)
  (jump-to-register 9)
  (keyboard-quit)
  )


(defun paste-copied()
  (interactive)
  (if (/= length-of-text 0)
      (progn
        (insert-register 8)
        (forward-char length-of-text))
    (progn
      (message "Nothing to insert...")
      )
    )
  )
