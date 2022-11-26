(deftemplate color
    (slot value)
)

(defrule colors
    (flag (country ?) (colors $? ?c $?))
    (not (color (value ?c)))
    =>
    (assert (color (value ?c)))
)

(defrule print-colors
    (color (value ?c))
    =>
    (printout t ?c crlf)
)
