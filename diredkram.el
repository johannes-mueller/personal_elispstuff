
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq dired-omit-files-p t)

(setq dired-guess-shell-alist-user
      (list
       (list "\\.ps$" "gv")
       (list "\\.midi$" "timidity")
       (list "\\.mp3$" "mpg321")
       )
      )