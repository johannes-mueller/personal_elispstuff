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

