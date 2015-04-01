;; ==================================
;; My global-keys
;;

(define-key global-map "\M-\d"       'kill-line)
(global-set-key (kbd "<M-backspace>") 'backward-kill-line)

(global-set-key (kbd "<S-backspace>") 'johmue/delete-whitespace-backward)
(global-set-key (kbd "<S-delete>") 'johmue/delete-whitespace-forward)

(global-set-key (kbd "<S-SPC>") 'johmue/mark-current-line)

(global-set-key (kbd "C-c C-l") 'johmue/eval-this-line)
(global-set-key (kbd "C-c C-d") 'eval-defun)

(global-set-key (kbd "C-c C-k") 'comment-region)
(global-set-key (kbd "C-c k") 'uncomment-region)

(global-set-key (kbd "C-c C-j") 'johmue/comment-current-line)
(global-set-key (kbd "C-c j") 'johmue/uncomment-current-line)

(define-key global-map [f9]          'copy-for-paste)
(define-key global-map [f10]         'paste-copied)

;(define-key global-map [f11]         'ispell-buffer)
;(define-key global-map [(meta f11)]  'flyspell-auto-correct-word)

;(define-key global-map '(meta control kp-right) 'bigframe)
;(define-key global-map '(meta control kp-6) 'bigframe)
;(define-key global-map '(meta control kp-left) 'normalframe)
;(define-key global-map '(meta control kp-4) 'normalframe)


(define-key global-map [(meta g)] 'magit-status)
