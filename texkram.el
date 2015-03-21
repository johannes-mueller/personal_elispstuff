(defun save-and-TeX()
  (interactive)
  (save-buffer)
  (TeX-command-master)
  )

(require 'reftex)

(defun pauseinsert()
  (interactive)
  (insert "\\pause")
)

; Compilation
(defun makeclean () (interactive) (compile "make clean"))
(defun make () (interactive) (compile "make"))


(define-key global-map [(meta f3)]     'TeX-complete-symbol)
(define-key global-map [(meta p)]  'pauseinsert)
(define-key global-map [f12] 'make)


(setq TeX-electric-escape nil)
(setq TeX-parse-self t)
(setq TeX-auto-save t)
(setq TeX-PDF-mode t)
(setq safe-local-variable-values 
      (quote ((LaTeX-command . "latex --shell-escape --synctex=1")
	      (LaTeX-command . "xelatex --shell-escape --synctex=1"))))

(setq TeX-view-program-list
      '(("Okular"
	 ("okular --unique %o"
	  (mode-io-correlate "#src:%n%b")))))
(setq TeX-view-program-selection '((output-pdf "Okular")))

(reftex-mode)
(setq reftex-fref-is-default t)
(setq reftex-plug-into-AUCTeX t)

(defun tocwindow () 
  (interactive)
  (reftex-toc)
  (shrink-window 10)
)

(define-key global-map [(control c) t] 'tocwindow)

;; Enable synctex correlation
(setq TeX-source-correlate-method 'synctex)
;; Enable synctex generation. Even though the command shows
;; as "latex" pdflatex is actually called
(custom-set-variables '(LaTeX-command "latex -synctex=1") )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use Okular as the pdf viewer. Build okular 
;; command, so that Okular jumps to the current line 
;; in the viewer.
(setq TeX-view-program-selection
 '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
 '(("PDF Viewer" "okular --unique %o#src:%n%b")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; (TeX-add-style-hook "mystuff"
;;  (function
;;   (lambda ()
;;     (TeX-add-symbols
;;      '("subfig" ["argument"] 1)
;;      '("pdiff" ["argument"] 2)
;;      '("diff" ["argument"] 2)
;;      '("chem" 1)
;;      '("begriff" 1)
;;      '("person" 1)
;;      '("ee" 1)
;;      '("inunfrac" 2)
;;      '("inun" 1)
;;      '("skalpr" 2)
;;      '("tens" 1)
;;      '("vect" 1)
;;      '("matr" 1)
;;      '("verbose" 1)
;;      "df"
;;      "pdf"
;;      "laplace"
;;      "grad"
;;      "Div"
;;      "rot"
;;      "follows"
;;      "nfollows"
;;      "imag"
;;      "degree"
;;      "CommaOrdinary"
;;      "CommaPunct"
;;      "CommaCheck"
;;      "subcapfont"
;;      "noparskip"))))

;(load "my_floats")

;(german)
;;(set-face-foreground 'font-latex-italic-face  "lightcoral")
;;(set-face-foreground 'font-latex-math-face    "dodgerblue")
;;(set-face-foreground 'font-latex-sedate-face  "gray51")
;;(set-face-foreground 'font-latex-string-face  "green3")
;;(set-face-foreground 'font-latex-warning-face "red")
