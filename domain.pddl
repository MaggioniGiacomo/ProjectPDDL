(define (domain maze)

        (:requirements :negative-preconditions :fluents)


        (:functions
                (fungus-charges)
        )

        (:predicates
                (LAVA ?x ?y)
                (at-fungus ?x ?y)
                (HOLE ?x ?y)
                (at-wizard ?x ?y)
                (inc ?p ?np)
                (dec ?p ?np)
                
        )

        (:action move-right
                :parameters (?x ?y ?xn)
                :precondition (and (inc ?x ?xn) (at-wizard ?x ?y) (not(LAVA ?xn ?y)) (not(HOLE ?xn ?y)))
                :effect (and (at-wizard ?xn ?y) (not (at-wizard ?x ?y)))
        )
        (:action move-left
                :parameters (?x ?y ?xn)
                :precondition (and (dec ?x ?xn) (at-wizard ?x ?y) (not(LAVA ?xn ?y)) (not(HOLE ?xn ?y)))
                :effect (and (at-wizard ?xn ?y) (not (at-wizard ?x ?y)))
        )
        (:action move-down
                :parameters (?x ?y ?yn)
                :precondition (and (inc ?y ?yn) (at-wizard ?x ?y) (not(LAVA ?x ?yn)) (not(HOLE ?x ?yn)))
                :effect (and (at-wizard ?x ?yn) (not (at-wizard ?x ?y)))
        )
        (:action move-up
                :parameters (?x ?y ?yn)
                :precondition (and (dec ?y ?yn) (at-wizard ?x ?y) (not(LAVA ?x ?yn)) (not(HOLE ?x ?yn)))
                :effect (and (at-wizard ?x ?yn) (not (at-wizard ?x ?y)))
        )
        (:action eat-fungus
                :parameters (?x ?y)
                :precondition (and 
                        (at-wizard ?x ?y) (at-fungus ?x ?y)
                )
                :effect (and 
                        (not (at-fungus ?x ?y)) 
                        (increase (fungus-charges) 2)        
                )
        )
        (:action cross-up
                :parameters (?x ?y ?yn ?ynn)
                :precondition (and 
                        (at-wizard ?x ?y)
                        (dec ?y ?yn) (dec ?yn ?ynn)
                        (not (LAVA ?x ?yn)) (HOLE ?x ?yn)
                        (not (LAVA ?x ?ynn)) (not(HOLE ?x ?ynn))
                        (> (fungus-charges) 0)
                )
                :effect (and 
                        (at-wizard ?x ?ynn) (not (at-wizard ?x ?y))
                        (decrease (fungus-charges) 1) 
                )
        )

)