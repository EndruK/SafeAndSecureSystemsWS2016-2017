context with Thread; use Thread;
        with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;

code Ada.Text_IO.Put_Line("Begin testing: ");

(*Test the Initialize Procedure*)

***** Initialize Thread sets None to Ready
define  S : State := None;
test    Initialize;
pass    S = Ready

***** Initialize Thread sets Ready to Ready
define  S : State := Ready;
test    Initialize;
pass    S = Ready

***** Initialize Thread sets Running to Ready
define  S : State := Running;
test    Initialize;
pass    S = Ready

***** Initialize Thread sets Stopped to Ready
define  S : State := Stopped;
test    Initialize;
pass    S = Ready

***** Initialize Thread sets Sleeping to Ready
define  S : State := Sleeping;
test    Initialize;
pass    S = Ready

***** Initialize Thread sets Waiting to Ready
define  S : State := Waiting;
test    Initialize;
pass    S = Ready

(*Test the Do_Action Procedure*)

***** Do_Action Stop -> State is Ready, Action is Stop
define  S : State := Ready;
        Test_Action : Action := Stop;
test    Do_Action(Test_Action);
pass    S = Stopped

***** Do_Action Start -> State is Ready, Action is Start
define  S : State := Ready;
        Test_Action : Action := Start;
test    Do_Action(Test_Action);
pass    S = Running

***** Do_Action Notify -> State is Waiting, Action is Notify
define  S : State := Waiting;
        Test_Action : Action := Notify;
test    Do_Action(Test_Action);
pass    S = Running

***** Do_Action Sleep -> State is Running, Action is Sleep
define  S : State := Running;
        Test_Action : Action := Sleep;
test    Do_Action(Test_Action);
pass    S = Sleeping

***** Do_Action Wait -> State is Running, Action is Wait
define  S : State := Running;
        Test_Action : Action := Wait;
test    Do_Action(Test_Action);
pass    S = Waiting

***** Do_Action Stop -> State is Running, Action is Stop
define  S : State := Running;
        Test_Action : Action := Stop;
test    Do_Action(Test_Action);
pass    S = Stopped

***** Do_Action Resume -> State is Sleeping, Action is Resume
define  S : State := Sleeping;
        Test_Action : Action := Resume;
test    Do_Action(Test_Action);
pass    S = Running

***** Test an iteration over all States with all Actions
define  S : State := Ready;
        Start_Action : Action := Start;
        Stop_Action : Action := Stop;
        Notify_Action : Action := Notify;
        Wait_Action : Action := Wait;
        Resume_Action : Action := Resume;
        Sleep_Action : Action := Sleep;
prepare Initialize;
        Do_Action(Start_Action);
        Do_Action(Wait_Action);
        Do_Action(Notify_Action);
        Do_Action(Sleep_Action);
        Do_Action(Resume_Action);
test    Do_Action(Stop_Action);
pass    S = Stopped

code Ada.Text_IO.Put_Line("End testing");
