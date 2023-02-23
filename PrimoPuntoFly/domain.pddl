(define (domain maze)

        (:requirements :negative-preconditions)

        (:predicates
                (LAVA ?x ?y)
                (HOLE ?x ?y)
                (EXIT ?x ?y)

                (at-invirgus ?x ?y)
                (at-wizard ?x ?y)
                (inc ?p ?np)
                (dec ?p ?np)
                (at-fungus ?x ?y)
                (fungus-charges ?n)
                (inc-charges ?n ?nn)
                (dec-charges ?n ?nn)

                (wizard-exit)
        )

        (:action move-right
                :parameters (?x ?y ?xn)
                :precondition (and (inc ?x ?xn) (at-wizard ?x ?y) (not(LAVA ?xn ?y)) (not(HOLE ?xn ?y)) (not(at-invirgus ?xn ?y)))
                :effect (and (at-wizard ?xn ?y) (not (at-wizard ?x ?y)))
        )
        (:action move-left
                :parameters (?x ?y ?xn)
                :precondition (and (dec ?x ?xn) (at-wizard ?x ?y) (not(LAVA ?xn ?y)) (not(HOLE ?xn ?y)) (not(at-invirgus ?xn ?y)))
                :effect (and (at-wizard ?xn ?y) (not (at-wizard ?x ?y)))
        )
        (:action move-down
                :parameters (?x ?y ?yn)
                :precondition (and (inc ?y ?yn) (at-wizard ?x ?y) (not(LAVA ?x ?yn)) (not(HOLE ?x ?yn)) (not(at-invirgus ?x ?yn)))
                :effect (and (at-wizard ?x ?yn) (not (at-wizard ?x ?y)))
        )
        (:action move-up
                :parameters (?x ?y ?yn)
                :precondition (and (dec ?y ?yn) (at-wizard ?x ?y) (not(LAVA ?x ?yn)) (not(HOLE ?x ?yn)) (not(at-invirgus ?x ?yn)))
                :effect (and (at-wizard ?x ?yn) (not (at-wizard ?x ?y)))
        )
        (:action eat-fungus
                :parameters (?x ?y ?n ?nn)
                :precondition (and
                        (at-wizard ?x ?y) (at-fungus ?x ?y)
                        (inc-charges ?n ?nn)
                        (fungus-charges ?n)
                )
                :effect (and
                        (not (at-fungus ?x ?y))
                        (not(fungus-charges ?n))
                        (fungus-charges ?nn)
                )
        )
        (:action fly-up
                :parameters (?x ?y ?yn ?n ?nn)
                :precondition (and
                        (fungus-charges ?n)
                        (dec-charges ?n ?nn)
                        (at-wizard ?x ?y)
                        (dec ?y ?yn)
                        (not (LAVA ?x ?yn)) (not(at-invirgus ?x ?yn)) (HOLE ?x ?yn)
                )
                :effect (and
                        (at-wizard ?x ?yn) (not (at-wizard ?x ?y))
                        (not(fungus-charges ?n)) (fungus-charges ?nn)
                )
        )
        (:action fly-down
                :parameters (?x ?y ?yn ?n ?nn)
                :precondition (and
                        (fungus-charges ?n)
                        (dec-charges ?n ?nn)
                        (at-wizard ?x ?y)
                        (inc ?y ?yn)
                        (not (LAVA ?x ?yn)) (not(at-invirgus ?x ?yn)) (HOLE ?x ?yn)
                )
                :effect (and
                        (at-wizard ?x ?yn) (not (at-wizard ?x ?y))
                        (not(fungus-charges ?n)) (fungus-charges ?nn)
                )
        )
        (:action fly-right
                :parameters (?x ?y ?xn ?n ?nn)
                :precondition (and
                        (fungus-charges ?n)
                        (dec-charges ?n ?nn)
                        (at-wizard ?x ?y)
                        (inc ?x ?xn)
                        (not (LAVA ?xn ?y)) (not(at-invirgus ?xn ?y)) (HOLE ?xn ?y)
                )
                :effect (and
                        (at-wizard ?xn ?y) (not (at-wizard ?x ?y))
                        (not(fungus-charges ?n)) (fungus-charges ?nn)
                )
        )
        (:action fly-left
                :parameters (?x ?y ?xn ?n ?nn)
                :precondition (and
                        (fungus-charges ?n)
                        (dec-charges ?n ?nn)
                        (at-wizard ?x ?y)
                        (dec ?x ?xn)
                        (not (LAVA ?xn ?y)) (not(at-invirgus ?xn ?y)) (HOLE ?xn ?y)
                )
                :effect (and
                        (at-wizard ?xn ?y) (not (at-wizard ?x ?y))
                        (not(fungus-charges ?n)) (fungus-charges ?nn)
                )
        )
        (:action escape
                :parameters (?x ?y)
                :precondition (and
                        (at-wizard ?x ?y) (EXIT ?x ?y)
                )
                :effect (wizard-exit)
        )

)