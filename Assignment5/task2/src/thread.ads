-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
pragma SPARK_Mode(on);
package Thread is
    pragma Assertion_Policy(Check);

    type State is (None, Ready, Running, Stopped, Sleeping, Waiting);
    type Action is (Notify, Resume, Sleep, Start, Stop, Wait);
    -- Illegal_Transition : exception;

    S: State := None;

    -- Sets S to Ready.
    procedure Initialize with
        Post => Thread.S = Ready,
        Global => (
            Output => (
                Thread.S
            )
        );
    -- Updates the state S according to the given input state S, and the
    -- given action A. Sets S to None if the transition is not defined.
    procedure Do_Action(A: Action) with
        Pre  => (Thread.S /= None),
        Post => (Thread.S = Thread.S'Old) = False
            or (if Thread.S'Old = Ready and A = Stop
                then Thread.S = Stopped)
            or (if Thread.S'Old = Ready and A = Start
                then Thread.S = Running)
            or (if Thread.S'Old = Running and A = Wait
                then Thread.S = Waiting)
            or (if Thread.S'Old = Running and A = Sleep
                then Thread.S = Sleeping)
            or (if Thread.S'Old = Running and A = Stop
                then Thread.S = Stopped)
            or (if Thread.S'Old = Waiting and A = Notify
                then Thread.S = Running)
            or (if Thread.S'Old = Sleeping and A = Resume
                then Thread.S = Running),
        Global => (
            In_Out => (
                Thread.S
            )
        ),
        Depends => (
            Thread.S => +A
        );

    -- pragma Export_Procedure:
    -- used this package so that the State can be set to None and
    -- in addition an Exception can be thrown
    -- pragma Export_Procedure (Do_Action, Mechanism => (Thread.S => Reference));
end Thread;
