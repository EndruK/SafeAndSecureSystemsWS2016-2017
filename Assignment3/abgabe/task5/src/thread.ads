-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package Thread is
    pragma Assertion_Policy(Check);

    type State is (None, Ready, Running, Stopped, Sleeping, Waiting);
    type Action is (Notify, Resume, Sleep, Start, Stop, Wait);
    Illegal_Transition : exception;

    -- Sets S to Ready.
    procedure Initialize(S: out State) with
        Post => S = Ready;

    -- Updates the state S according to the given input state S, and the
    -- given action A. Sets S to None if the transition is not defined.
    procedure Do_Action(S: in out State; A: Action) with
        Post => (S = S'Old) = False
            or (S = None and S = S'Old);

    -- pragma Export_Procedure:
    -- used this package so that the State can be set to None and
    -- in addition an Exception can be thrown
    pragma Export_Procedure (Do_Action, Mechanism => (S => Reference));
end Thread;
