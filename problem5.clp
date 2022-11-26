(deftemplate square
    (slot id)
    (slot side-length)
)

(deftemplate rectangle
    (slot id)
    (slot width)
    (slot height)
)

(deftemplate circle
    (slot id)
    (slot radius)
)

(defrule area-square
    (square (id ?id) (side-length ?side))
    =>
    (assert (area ?id (* ?side ?side)))
)

(defrule area-rectangle
    (rectangle (id ?id) (width ?width) (height ?height))
    =>
    (assert (area ?id (* ?width ?height)))
)

(defrule area-circle
    (circle (id ?id) (radius ?radius))
    =>
    (assert (area ?id (* 3.14 (* ?radius ?radius))))
)

(defrule perimeter-square
    (square (id ?id) (side-length ?side-length))
    =>
    (assert (perimeter ?id (* 4 ?side-length)))
)

(defrule perimeter-rectangle
    (rectangle (id ?id) (width ?width) (height ?height))
    =>
    (assert (perimeter ?id (+ (* 2 ?width) (* 2 ?height))))
)

(defrule perimeter-circle
    (circle (id ?id) (radius ?radius))
    =>
    (assert (perimeter ?id  (* 2 3.14 ?radius)))
)

(defrule init-sum-area
    (not (sum-area ?))
    =>
    (assert (sum-area 0))
)

(defrule init-sum-perimeter
    (not (sum-perimeter ?))
    =>
    (assert (sum-perimeter 0))
)

(defrule sum-area
    ?p <- (area ?id ?area)
    ?f <- (sum-area ?sum)
    =>
    (retract ?f)
    (retract ?p)
    (assert (sum-area (+ ?sum ?area)))
)

(defrule sum-perimeter
    ?p <- (perimeter ?id ?perimeter)
    ?f <- (sum-perimeter ?sum)
    =>
    (retract ?f)
    (retract ?p)
    (assert (sum-perimeter (+ ?sum ?perimeter)))
)

(deffacts test
    (square (id A) (side-length 3))
    (square (id B) (side-length 5))
    (rectangle (id C) (width 2) (height 5))
    (circle (id D) (radius 2))
    (circle (id E) (radius 6))
)