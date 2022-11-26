(deffacts familes
    (Father Ahmed Mohammed)
    (Mother Mona Ali)
    (Father Ali Sara)
    (Father Hassan Ahmed))

(defrule parent
    (or (Father ?x ?y) (Mother ?x ?y))
    =>
    (assert (Parent ?x ?y)))

(defrule grandfather
    (Father ?x ?y)
    (Parent ?y ?z)
    =>
    (assert (Grandfather ?x ?z)))

(defrule grandmother
    (Mother ?x ?y)
    (Parent ?y ?z)
    =>
    (assert (Grandmother ?x ?z)))