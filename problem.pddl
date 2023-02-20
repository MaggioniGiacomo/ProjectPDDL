(define (problem WizardWithoutInvirgus)
    (:domain maze)
    (:objects
        p1 p2 p3
    )

    (:init
        (at-wizard p1 p3)
        (LAVA p2 p2) (LAVA p1 p1)
        (at-fungus p1 p2)
        (HOLE p3 p2)
        (inc p1 p2) (inc p2 p3)
        (dec p2 p1) (dec p3 p2)
        (= (fungus-charges) 0)
    )

    (:goal
        (at-wizard p2 p1)
    )
)
