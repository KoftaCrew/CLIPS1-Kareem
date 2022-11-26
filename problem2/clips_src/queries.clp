(defrule color-query
    (query ?q)
    (flag (country ?c) (colors $? ?q $?))
    =>
    (printout t ?c " flag has the color " ?q " in it" crlf)
)

(defrule remove-query
    (declare (salience -1))
    ?q <- (query ?)
    =>
    (retract ?q)
)