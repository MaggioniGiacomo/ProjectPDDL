;
;  Domain file: definisce le azioni (predicates) che possono avvenire 
;   sulla base delle condizioni degli oggetti.
;

(define (domain labirinto)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
)

; un-comment following line if constants are needed
;(:constants )

(:predicates
        (LAVA ?x ?y)
        (FUNGUS ?x ?y)
        (WELL ?x ?y)
        (INVIRGUS ?x ?y)
        (WIZARD ?x ?y)
        (EXIT ?x ?y)
)


(:functions ;todo: define numeric functions here
)

;define actions here

)