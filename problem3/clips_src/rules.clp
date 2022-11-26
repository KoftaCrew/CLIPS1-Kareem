(defrule input-stream
    "If (file <filename>) is specified, open it as input"
    ?fact <- (input ?filename)
    =>
    (open ?filename input "r")
    (bind ?line (readline input))
    (while (neq ?line EOF)
        (bind ?response (explode$ ?line))
        (assert (gpa ?response))
        (bind ?line (readline input)))
    (close input)
    (retract ?fact)
)

(defrule output-stream
    "Clear output file if exists"
    (declare (salience 1))
    ?fact <- (output ?filename)
    =>
    (open ?filename output "w")
    (close output)
)

(defrule gpa
    ?gpa <- (gpa ?name $?grades)
    (output ?filename)
    =>
    (open ?filename output "a")
    (printout output ?name " " ?grades " " (/ (+ (expand$ ?grades)) 4) crlf)
    (close output)
    (retract ?gpa)
)

(defrule clear-output-fact
    "Remove output fact after all gpa facts are processed"
    (declare (salience -1))
    ?fact <- (output ?filename)
    =>
    (retract ?fact)
)
