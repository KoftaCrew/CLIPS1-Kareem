(defclass Shape
    (is-a USER)
    (role abstract)
    (slot ID (type SYMBOL))
    (slot color (allowed-values red blue green yellow))
)

(defclass Square
    (is-a Shape)
    (role concrete)
    (slot length (type NUMBER))
)

(defclass Rectangle
    (is-a Shape)
    (role concrete)
    (slot width (type NUMBER))
    (slot length (type NUMBER))
)

(defmessage-handler Square calcArea ()
    (* ?self:length ?self:length)
)

(defmessage-handler Rectangle calcArea ()
    (* ?self:width ?self:length)
)
