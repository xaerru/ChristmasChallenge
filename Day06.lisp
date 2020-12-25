; Day 6
; Secret Santa!

; Challenge:
; Write a program that, after inputting all members, generates a secret santa ‘sequence’. 
; For those who don’t know what secret santa is: you get a random name (which is not yourself) for whom you have to buy a present. 
; Everyone should get a present from 1 person and everyone should have to buy a present for 1.

; Language -> Common Lisp

(defun ask-and-read (prompt)
  (princ prompt *query-io*)
  (force-output *query-io*)  ; flush the buffers
  (let ((*read-eval* nil))   ; close the security hole
    (read *query-io*)))

(defun request-object (prompt predicate)
  (loop
    for object = (ask-and-read prompt)
    when (funcall predicate object)
      return object
    do (format *query-io* "Number of people participating in Secret Santa cannot be ~S.~%Try entering a number.~%" (string-downcase object))))

(write-line "Welcome to Secret Santa Sequence generator!")

(fresh-line)

(defvar number-of-people (request-object "How many people are participating in Secret Santa? -> "#'integerp))

(defvar people-list (list))

(write-line "Enter your names one by one ->")

(loop for x from 1 to number-of-people
      do (format t "~D: " x)
      do (push (read) people-list))

; knuth shuffle
(defun nshuffle (sequence)
  (loop for i from (length sequence) downto 2
        do (rotatef (elt sequence (random i))
                    (elt sequence (1- i))))
        sequence)

(defvar shuffled-people-list (nshuffle people-list))

(format t "~%Here is the list of buyers and recievers:~%")

(loop for x from 0 to (- number-of-people 1)
      do (format t "~A buys for ~A~%" (string-capitalize (nth x shuffled-people-list)) (string-capitalize (nth (mod (+ x 1) number-of-people) shuffled-people-list))))


