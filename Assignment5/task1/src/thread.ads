-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package Thread with
    Spark_Mode is
    pragma Assertion_Policy(Check);

    type State is (None, Ready, Running, Stopped, Sleeping, Waiting);
    type Action is (Notify, Resume, Sleep, Start, Stop, Wait);
    -- Illegal_Transition : exception;

    S: State := None;

    -- Sets S to Ready.
    procedure Initialize with
        Post => Thread.S = Ready;

    -- Updates the state S according to the given input state S, and the
    -- given action A. Sets S to None if the transition is not defined.
    procedure Do_Action(A: Action) with
        Post => (Thread.S = Thread.S'Old) = False
            or (Thread.S = None and Thread.S = Thread.S'Old);

    -- pragma Export_Procedure:
    -- used this package so that the State can be set to None and
    -- in addition an Exception can be thrown
    -- pragma Export_Procedure (Do_Action, Mechanism => (Thread.S => Reference));
end Thread;
