(require 'clojure.string)
(println "How may I address you?")
(println "Merry Christmas," (clojure.string/capitalize (read-line)))
