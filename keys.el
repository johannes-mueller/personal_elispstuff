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

(global-set-key (kbd "C-c C-;") 'johmue/comment-current-line)
(global-set-key (kbd "C-c ;") 'johmue/uncomment-current-line)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(define-key global-map [(meta up)] 'johmue/scroll-other-window-one-up)
(define-key global-map [(meta down)] 'johmue/scroll-other-window-one-down)

(define-key global-map [f9]          'copy-for-paste)
(define-key global-map [f10]         'paste-copied)

(eval-after-load "cc-mode"
  '(progn
     (define-key c-mode-base-map [f12] 'johmue/make)
     )
  )

(eval-after-load "rust-mode"
  '(progn
     (define-key rust-mode-map [f12] 'cargo-process-build)
     )
  )
;(define-key global-map [f11]         'ispell-buffer)
;(define-key global-map [(meta f11)]  'flyspell-auto-correct-word)

;(define-key global-map '(meta control kp-right) 'bigframe)
;(define-key global-map '(meta control kp-6) 'bigframe)
;(define-key global-map '(meta control kp-left) 'normalframe)
;(define-key global-map '(meta control kp-4) 'normalframe)


(define-key global-map [(meta g)] 'magit-status)

(define-key projectile-mode-map [f12] 'projectile-compile-project)
(define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-showh-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

(global-set-key (kbd "M-s") 'helm-swoop-from-isearch)
(global-set-key (kbd "C-f") 'helm-swoop-without-pre-input)

(global-set-key [f7] 'helm-projectile-rg)
(global-set-key [M-f7] 'helm-projectile-grep)

;;; keys.el ends here
