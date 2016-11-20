context with Elections; use Elections;
        with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;

code Ada.Text_IO.Put_Line("Begin testing: ");

(*Test the Initialize Procedure*)

***** Initialize Elections 0
define  Num_Voters : Integer := 0;
test    Initialize(Num_Voters);
pass    Num_Total_Voters = Num_Voters and
        Num_Votes_Made = 0 and
        Votes_Distribution = Zero_Votes_Distribution

***** Initialize Elections 1
define  Num_Voters : Integer := 1;
test    Initialize(Num_Voters);
pass    Num_Total_Voters = Num_Voters and
        Num_Votes_Made = 0 and
        Votes_Distribution = Zero_Votes_Distribution

***** Initialize Elections 10
define  Num_Voters : Integer := 10;
test    Initialize(Num_Voters);
pass    Num_Total_Voters = Num_Voters and
        Num_Votes_Made = 0 and
        Votes_Distribution = Zero_Votes_Distribution

***** Initialize Elections 300
define  Num_Voters : Integer := 300;
test    Initialize(Num_Voters);
pass    Num_Total_Voters = Num_Voters and
        Num_Votes_Made = 0 and
        Votes_Distribution = Zero_Votes_Distribution

***** Check if Initialize resets an old election
define  Num_Voters : Integer := 100;
prepare Initialize(50);
        Vote_For(A);
        Vote_For(B);
        Vote_For(C);
test    Initialize(Num_Voters);
pass    Num_Total_Voters = Num_Voters and
        Num_Votes_Made = 0 and
        Votes_Distribution = Zero_Votes_Distribution

***** Check Initialize for values out of range +
define  Except : Boolean := False;
test    begin
            Initialize(999999999999999999999);
        exception
            when CONSTRAINT_ERROR => Except := True;
        end;
pass    Except = True

***** Check Initialize for values out of range -
define  Except : Boolean := False;
test    begin
            Initialize(-1);
        exception
            when CONSTRAINT_ERROR => Except := True;
        end;
pass    Except = True

(*Test All_Voters_Vote Function*)
***** Check if nobody voted
define  all_voted : Boolean := True;
prepare Initialize(10);
test    all_voted := All_Voters_Voted;
pass    not all_voted

***** Check if one voted less people
define  all_voted : Boolean := True;
prepare Initialize(10);
        Vote_For(A);
test    all_voted := All_Voters_Voted;
pass    not all_voted

***** Check if not all voted less people
define  all_voted : Boolean := True;
prepare Initialize(10);
        for I in 1..5 loop
            Vote_For(A);
        end loop;
test    all_voted := All_Voters_Voted;
pass    not all_voted

***** Check if all voted less people
define  all_voted : Boolean := True;
prepare Initialize(3);
        for I in 1..3 loop
            Vote_For(A);
        end loop;
test    all_voted := All_Voters_Voted;
pass    all_voted

***** Check if one voted many people
define  all_voted : Boolean := True;
prepare Initialize(300);
        Vote_For(A);
test    all_voted := All_Voters_Voted;
pass    not all_voted

***** Check if not all voted many people
define  all_voted : Boolean := True;
prepare Initialize(300);
        for I in 1..200 loop
            Vote_For(A);
        end loop;
test    all_voted := All_Voters_Voted;
pass    not all_voted

***** Check if all voted many people
define  all_voted : Boolean := True;
prepare Initialize(300);
        for I in 1..300 loop
            Vote_For(A);
        end loop;
test    all_voted := All_Voters_Voted;
pass    all_voted

(*Test the Vote_For Procedure*)

***** Check voting A
prepare Initialize(10);
test    Vote_For(A);
pass    Votes_Distribution(A) = 1
        and Votes_Distribution(B) = 0
        and Votes_Distribution(C) = 0
        and Votes_Distribution(D) = 0
        and Votes_Distribution(None) = 0

***** Check voting B
prepare Initialize(10);
test    Vote_For(B);
pass    Votes_Distribution(A) = 0
        and Votes_Distribution(B) = 1
        and Votes_Distribution(C) = 0
        and Votes_Distribution(D) = 0
        and Votes_Distribution(None) = 0

***** Check voting C
prepare Initialize(10);
test    Vote_For(C);
pass    Votes_Distribution(A) = 0
        and Votes_Distribution(B) = 0
        and Votes_Distribution(C) = 1
        and Votes_Distribution(D) = 0
        and Votes_Distribution(None) = 0

***** Check voting D
prepare Initialize(10);
test    Vote_For(D);
pass    Votes_Distribution(A) = 0
        and Votes_Distribution(B) = 0
        and Votes_Distribution(C) = 0
        and Votes_Distribution(D) = 1
        and Votes_Distribution(None) = 0

***** Check voting None
prepare Initialize(10);
test    Vote_For(None);
pass    Votes_Distribution(A) = 0
        and Votes_Distribution(B) = 0
        and Votes_Distribution(C) = 0
        and Votes_Distribution(D) = 0
        and Votes_Distribution(None) = 1

***** Check voting Votes_Made increment
prepare Initialize(10);
test    Vote_For(A);
pass    Num_Votes_Made = 1

***** Check multiple votes
prepare Initialize(3);
test    Vote_For(A);
        Vote_For(A);
        Vote_For(A);
pass    Num_Votes_Made = 3
        and Votes_Distribution(A) = 3

***** Check vote limit
define  Exception_Thrown : Boolean := False;
prepare Initialize(3);
        Vote_For(A);
        Vote_For(A);
        Vote_For(A);
test    begin
            Vote_For(A);
        exception
            when Assertion_Error => Exception_Thrown := True;
        end;
pass    Num_Votes_Made = 3
        and Exception_Thrown = True

(*Testing Finding_Winner Function*)

***** Check with 0 votes
define  Winner : Party := None;
prepare Initialize(100);
test    Winner := Find_Winner;
pass    Winner = None

***** Check if A wins (one person)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(A);
test    Winner := Find_Winner;
pass    Winner = A

***** Check if B wins (one people)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(B);
test    Winner := Find_Winner;
pass    Winner = B

***** Check if C wins (one people)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(C);
test    Winner := Find_Winner;
pass    Winner = C

***** Check if D wins (one people)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(D);
test    Winner := Find_Winner;
pass    Winner = D

***** Check if None wins (one people)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(None);
test    Winner := Find_Winner;
pass    Winner = None

***** Check if A wins with multiple votes
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(A);
        Vote_For(A);
        Vote_For(A);
        Vote_For(A);
        Vote_For(B);
        Vote_For(B);
        Vote_For(B);
        Vote_For(C);
test    Winner := Find_Winner;
pass    Winner = A

***** Check if there is a draw (2 parties)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(A);
        Vote_For(A);
        Vote_For(B);
        Vote_For(B);
test    Winner := Find_Winner;
pass    Winner = None

***** Check if there is a draw (3 parties)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(A);
        Vote_For(A);
        Vote_For(B);
        Vote_For(B);
        Vote_For(C);
        Vote_For(C);
test    Winner := Find_Winner;
pass    Winner = None

***** Check if there is a draw (4 parties)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(A);
        Vote_For(A);
        Vote_For(B);
        Vote_For(B);
        Vote_For(C);
        Vote_For(C);
        Vote_For(D);
        Vote_For(D);
test    Winner := Find_Winner;
pass    Winner = None

***** Check if there is a draw (4 parties with None)
define  Winner : Party := None;
prepare Initialize(100);
        Vote_For(A);
        Vote_For(A);
        Vote_For(B);
        Vote_For(B);
        Vote_For(C);
        Vote_For(C);
        Vote_For(D);
        Vote_For(D);
        Vote_For(None);
        Vote_For(None);
test    Winner := Find_Winner;
pass    Winner = None

code Ada.Text_IO.Put_Line("End testing");
