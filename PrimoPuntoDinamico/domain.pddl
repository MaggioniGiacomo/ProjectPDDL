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

                (wiz-turn)
                (inv-turn)
                (wizard-exit)
        )

        (:action move-right
                :parameters (?x ?y ?xn)
                :precondition (and 
                    (inc ?x ?xn) (at-wizard ?x ?y) 
                    (not(LAVA ?xn ?y)) (not(HOLE ?xn ?y)) (not(at-invirgus ?xn ?y))
                    (wiz-turn)
                )
                :effect (and 
                    (at-wizard ?xn ?y) (not (at-wizard ?x ?y))
                    (not(wiz-turn)) (inv-turn)
                )
        )
        (:action move-left
                :parameters (?x ?y ?xn)
                :precondition (and 
                    (dec ?x ?xn) (at-wizard ?x ?y) 
                    (not(LAVA ?xn ?y)) (not(HOLE ?xn ?y)) (not(at-invirgus ?xn ?y))
                    (wiz-turn)
                )
                :effect (and 
                    (at-wizard ?xn ?y) (not (at-wizard ?x ?y))
                    (not(wiz-turn)) (inv-turn)
                )
        )
        (:action move-down
                :parameters (?x ?y ?yn)
                :precondition (and 
                    (inc ?y ?yn) (at-wizard ?x ?y) 
                    (not(LAVA ?x ?yn)) (not(HOLE ?x ?yn)) (not(at-invirgus ?x ?yn))
                    (wiz-turn)
                )
                :effect (and 
                    (at-wizard ?x ?yn) (not (at-wizard ?x ?y))
                    (not(wiz-turn)) (inv-turn)
                )
        )
        (:action move-up
                :parameters (?x ?y ?yn)
                :precondition (and 
                    (dec ?y ?yn) (at-wizard ?x ?y) 
                    (not(LAVA ?x ?yn)) (not(HOLE ?x ?yn)) (not(at-invirgus ?x ?yn))
                    (wiz-turn)
                )
                :effect (and 
                    (at-wizard ?x ?yn) (not (at-wizard ?x ?y))
                    (not(wiz-turn)) (inv-turn)
                )
        )
        (:action eat-fungus
                :parameters (?x ?y ?n ?nn)
                :precondition (and
                        (at-wizard ?x ?y) (at-fungus ?x ?y)
                        (inc-charges ?n ?nn)
                        (fungus-charges ?n)
                        (wiz-turn)
                )
                :effect (and
                        (not (at-fungus ?x ?y))
                        (not(fungus-charges ?n))
                        (fungus-charges ?nn)
                        (not(wiz-turn)) (inv-turn)
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
                        (wiz-turn)
                )
                :effect (and
                        (at-wizard ?x ?yn) (not (at-wizard ?x ?y))
                        (not(fungus-charges ?n)) (fungus-charges ?nn)
                        (not(wiz-turn)) (inv-turn)
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
                        (wiz-turn) 
                )
                :effect (and
                        (at-wizard ?x ?yn) (not (at-wizard ?x ?y))
                        (not(fungus-charges ?n)) (fungus-charges ?nn)
                        (not(wiz-turn)) (inv-turn)
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
                        (wiz-turn)
                )
                :effect (and
                        (at-wizard ?xn ?y) (not (at-wizard ?x ?y))
                        (not(fungus-charges ?n)) (fungus-charges ?nn)
                        (not(wiz-turn)) (inv-turn)
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
                        (wiz-turn)
                )
                :effect (and
                        (at-wizard ?xn ?y) (not (at-wizard ?x ?y))
                        (not(fungus-charges ?n)) (fungus-charges ?nn)
                        (not(wiz-turn)) (inv-turn)
                )
        )
        (:action escape
                :parameters (?x ?y)
                :precondition (and
                        (at-wizard ?x ?y) (EXIT ?x ?y)
                        (wiz-turn)
                )
                :effect (wizard-exit)
        )

        ;esempio mossa invurgus, per ora non esegue l'azione e passa solo il turno
        (:action inv-action
            :parameters (?xinv ?yinv ?yn ?xwiz ?ywiz)
            :precondition (and 
                (inv-turn) 
                (at-invirgus ?xinv ?yinv) (at-wizard ?xwiz ?ywiz)
                ;TODO aggiunta comparazione posizione invurgus mago e controllo nuova posizione corretta
            )
            :effect (and 
                (not(inv-turn)) (wiz-turn)
            )
        )
        

)