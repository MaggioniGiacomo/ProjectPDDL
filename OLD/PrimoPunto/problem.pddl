(define (problem WizardWithoutInvirgus)
    (:domain maze)
    (:objects
        p1 p2 p3 p4 p5 p6 p7
        c0 c1 c2
    )

    (:init
        (at-wizard p3 p7)
        (at-invirgus p4 p2)

        (LAVA p1 p2)
        (LAVA p2 p1)
        (LAVA p6 p2)
        (LAVA p7 p3)
        (LAVA p1 p4)
        (LAVA p2 p4)
        (LAVA p3 p4)
        (LAVA p4 p4)
        (LAVA p5 p4)
        (LAVA p6 p5)
        (LAVA p6 p6)
        (LAVA p3 p6)
        (LAVA p2 p6)
        (LAVA p4 p7)

        (HOLE p5 p3)
        (HOLE p5 p6)
        (HOLE p1 p6)
        (HOLE p2 p5)

        (at-fungus p1 p7)
        (at-fungus p4 p6)
        (at-fungus p5 p1)

        (EXIT p1 p1)
        (EXIT p6 p1)

        (inc p1 p2) 
        (inc p2 p3)
        (inc p3 p4)
        (inc p4 p5)
        (inc p5 p6)
        (inc p6 p7)
        (dec p2 p1) 
        (dec p3 p2)
        (dec p4 p3)
        (dec p5 p4)
        (dec p6 p5)
        (dec p7 p6)

        (inc-charges c0 c2) (inc-charges c1 c2)
        (dec-charges c2 c1) (dec-charges c1 c0)
        (fungus-charges c0)
    )

    (:goal (wizard-exit))
)
