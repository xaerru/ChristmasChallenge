;; Day 1
;; It's that time of year again...

;; Challenge:
;; Write a program that asks a user for their name and outputs "Merry christmas, [name]"

;; Language -> Clojure

(require 'clojure.string)
(println "How may I address you?")
(println "Merry Christmas," (clojure.string/capitalize (read-line)))
