(deftemplate person
    (slot name)
    (multislot children)
)

(defrule parent-of-3
    (person (name ?name) (children ? ? ? ? $?))
    =>
    (printout t ?name " has more than 3 children" crlf)
)

(defrule parent-of
    (child-name ?child)
    (person (name ?name) (children $? ?child $?))
    =>
    (printout t ?name " is the parent of " ?child crlf)
)
