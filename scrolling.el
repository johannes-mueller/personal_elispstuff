;; Ein paar Zeilen hoch und runterscrollen (für wheelmouse)
;;

(defun scroll-4up () (interactive) (scroll-up 4))
(defun scroll-4down () (interactive) (scroll-down 4))
(define-key global-map [(button4)] 'scroll-4down)
(define-key global-map [(button5)] 'scroll-4up)

(defun scroll-8up () (interactive) (scroll-up 8))
(defun scroll-8down () (interactive) (scroll-down 8))
(define-key global-map [(shift button4)] 'scroll-8down)
(define-key global-map [(shift button5)] 'scroll-8up)

; Move in other window
(defun scroll-other-up () (interactive) (scroll-other-window-down 1)) ; hehe :)
(defun scroll-other-down () (interactive) (scroll-other-window 1))
(define-key global-map [(meta up)] 'scroll-other-up)
(define-key global-map [(meta down)] 'scroll-other-down)

(defun scroll-other-4up () (interactive) (scroll-other-window-down 4)) ; hehe :)
(defun scroll-other-4down () (interactive) (scroll-other-window 4))
(define-key global-map [(meta button4)] 'scroll-other-4up)
(define-key global-map [(meta button5)] 'scroll-other-4down)

(defun scroll-other-8up () (interactive) (scroll-other-window-down 8))
(defun scroll-other-8down () (interactive) (scroll-other-window 8))
(define-key global-map [(meta shift button4)] 'scroll-other-8up)
(define-key global-map [(meta shift button5)] 'scroll-other-8down)