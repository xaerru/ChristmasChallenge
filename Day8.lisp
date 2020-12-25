; Day 8
; Christmas List!

; Challenge:
; Write a program that allows the user to input a list of items they want to Christmas and save it to/load it from a file.

; Language -> Lisp

(write-line "Do you want to save gifts to a file or load it from the gifts file(type \"load\" for loading or \"save\" )")

(defvar choice (string (read)))

(defun save (fill-column)
(with-open-file (str "gifts.txt"
                     :direction :output
                     :if-exists :supersede
                     :if-does-not-exist :create)
  (write-line "Merry Christmas! Enter your gifts here line by line.")
  (terpri)
  (write-line "When you are done type \"END\"(All Caps) to stop listing your gifts.")
  (terpri)
  (format str "List of gifts for Santa:~%")
  (defvar cnt 1)
  (loop 
    (format t "~D: " cnt)
    (setq gift (read-line))
    (when (string= gift "END") (return))
    (format str "~D: ~A" cnt gift)
    (terpri str)
    (incf cnt))
  (write-line "All of your gifts are now in the file gifts.txt.")))

(defun loadFile
  (fill-column)
(fresh-line)
(terpri)
(write-line "The file contains ->")
(terpri)
(fresh-line)

(let ((in (open "gifts.txt" :if-does-not-exist nil)))
   (when in
      (loop for line = (read-line in nil)
      while line do (format t "~a~%" line))
      (close in)
   )
))
(if (string= choice "LOAD")
  (loadFile ())
  (save ()))
