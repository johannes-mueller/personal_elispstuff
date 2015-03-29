;; ==================================
;; My global-keys
;;

(define-key global-map "\M-\d"       'kill-line)
(global-set-key (kbd "<M-backspace>") 'backward-kill-line)

(global-set-key (kbd "<S-backspace>") 'johmue/delete-whitespace-backward)
(global-set-key (kbd "<S-delete>") 'johmue/delete-whitespace-forward)

;(define-key global-map [f5]          'fume-list-functions)
;(define-key global-map [(meta f5)]   'fume-prompt-function-goto)

(define-key global-map [f9]          'copy-for-paste)
(define-key global-map [f10]         'paste-copied)

;(define-key global-map [f11]         'ispell-buffer)
;(define-key global-map [(meta f11)]  'flyspell-auto-correct-word)

;(define-key global-map '(meta control kp-right) 'bigframe)
;(define-key global-map '(meta control kp-6) 'bigframe)
;(define-key global-map '(meta control kp-left) 'normalframe)
;(define-key global-map '(meta control kp-4) 'normalframe)


(define-key global-map [(meta g)] 'magit-status)
