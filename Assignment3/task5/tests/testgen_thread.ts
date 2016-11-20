context with Thread; use Thread;
        with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;

code Ada.Text_IO.Put_Line("Begin testing: ");

(*Test the Initialize Procedure*)

***** Initialize Thread sets None to Ready
define  Test_State : State := None;
test    Initialize(Test_State);
pass    Test_State = Ready

***** Initialize Thread sets Ready to Ready
define  Test_State : State := Ready;
test    Initialize(Test_State);
pass    Test_State = Ready

***** Initialize Thread sets Running to Ready
define  Test_State : State := Running;
test    Initialize(Test_State);
pass    Test_State = Ready

***** Initialize Thread sets Stopped to Ready
define  Test_State : State := Stopped;
test    Initialize(Test_State);
pass    Test_State = Ready

***** Initialize Thread sets Sleeping to Ready
define  Test_State : State := Sleeping;
test    Initialize(Test_State);
pass    Test_State = Ready

***** Initialize Thread sets Waiting to Ready
define  Test_State : State := Waiting;
test    Initialize(Test_State);
pass    Test_State = Ready

(*Test the Do_Action Procedure*)

***** Do_Action Stop -> State is Ready, Action is Stop
define  Test_State : State := Ready;
        Test_Action : Action := Stop;
test    Do_Action(Test_State, Test_Action);
pass    Test_State = Stopped

***** Do_Action Start -> State is Ready, Action is Start
define  Test_State : State := Ready;
        Test_Action : Action := Start;
test    Do_Action(Test_State, Test_Action);
pass    Test_State = Running

***** Do_Action Notify -> State is Waiting, Action is Notify
define  Test_State : State := Waiting;
        Test_Action : Action := Notify;
test    Do_Action(Test_State, Test_Action);
pass    Test_State = Running

***** Do_Action Sleep -> State is Running, Action is Sleep
define  Test_State : State := Running;
        Test_Action : Action := Sleep;
test    Do_Action(Test_State, Test_Action);
pass    Test_State = Sleeping

***** Do_Action Wait -> State is Running, Action is Wait
define  Test_State : State := Running;
        Test_Action : Action := Wait;
test    Do_Action(Test_State, Test_Action);
pass    Test_State = Waiting

***** Do_Action Stop -> State is Running, Action is Stop
define  Test_State : State := Running;
        Test_Action : Action := Stop;
test    Do_Action(Test_State, Test_Action);
pass    Test_State = Stopped

***** Do_Action Resume -> State is Sleeping, Action is Resume
define  Test_State : State := Sleeping;
        Test_Action : Action := Resume;
test    Do_Action(Test_State, Test_Action);
pass    Test_State = Running

***** Do_Action with an invalid Action sets State to None and throws an exception
define  Test_State : State := Ready;
        Test_Action : Action := Wait;
        Except : Boolean := False;
prepare Initialize(Test_State);
test    begin
            Do_Action(Test_State, Test_Action);
        exception
            when Illegal_transition => Except := True;
        end;
pass    Test_State = None
        and Except

***** Test an iteration over all States with all Actions
define  Test_State : State := Ready;
        Start_Action : Action := Start;
        Stop_Action : Action := Stop;
        Notify_Action : Action := Notify;
        Wait_Action : Action := Wait;
        Resume_Action : Action := Resume;
        Sleep_Action : Action := Sleep;
prepare Initialize(Test_State);
        Do_Action(Test_State, Start_Action);
        Do_Action(Test_State, Wait_Action);
        Do_Action(Test_State, Notify_Action);
        Do_Action(Test_State, Sleep_Action);
        Do_Action(Test_State, Resume_Action);
test    Do_Action(Test_State, Stop_Action);
pass    Test_State = Stopped

code Ada.Text_IO.Put_Line("End testing");
