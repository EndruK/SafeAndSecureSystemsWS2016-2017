-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       /home/andre/Github/SafeAndSecureSystemsWS2016-2017/Assignment6/task3/tests/test.adb
  -- Script:     /home/andre/Github/SafeAndSecureSystemsWS2016-2017/Assignment6/task3/tests/test.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Parallel_Algorithms;
with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;

procedure test is

  package Driver_Internals is
    -- Global Data
    Program_Terminate     : exception;
    Fail_Result           : Boolean := False;
    Unexpected_Error      : Boolean := False;
    Status                : Ada.Command_Line.Exit_Status := 0;
    -- Data of last Test Case
    Test_Case_Passed      : Boolean := False;
    -- Access Routines
    procedure Set_Path (Path : in String);
    function Path_Was (Path : in String) return Boolean;
    function Taken_Path return String;
    function Passed return Boolean;
    function Failed return Boolean;
  end Driver_Internals;

  -- Global definitions from script
  Epsilon : constant Float := 0.00001;

  package body Driver_Internals is
    -- Data of last Test Case
    Test_Case_Path        : String (1.. 256);
    Test_Case_Path_Length : Natural := 0;
    -- Access Routines
    procedure Set_Path (Path : in String) is
      begin
        Test_Case_Path (Test_Case_Path'First..Path'Length) := Path;
        Test_Case_Path_Length := Path'Length;
      end Set_Path;
    function Path_Was (Path : in String) return Boolean is
      begin
        return Test_Case_Path_Length = Path'Length
            and then Test_Case_Path (1..Path'Length) = Path;
      end Path_Was;
    function Taken_Path return String is
      begin return Test_Case_Path (1..Test_Case_Path_Length); end Taken_Path;
    function Passed return Boolean is
      begin return Test_Case_Passed; end Passed;
    function Failed return Boolean is
      begin return not Test_Case_Passed; end Failed;
  end Driver_Internals;

begin  -- unit main block

  -- Code section
  begin
    Ada.Text_IO.Put_Line("Begin testing: ");
  end;  -- code block

  -- Test Case (1)   Init Result with 0
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    Result : constant Integer := 0;
  begin  -- test case
    Put_Line ("(1)  Init Result with 0");
    begin  -- test part
      null;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = 0
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:8 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:8 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 1.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (2)   Init Tasks with 0
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array_Access : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type'(1,2,3,4,5,6);
    Tasks  : constant Integer := 0;
  begin  -- test case
    Put_Line ("(2)  Init Tasks with 0");
    begin  -- test part
      null;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Tasks = 0
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:15 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:15 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 2.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (3)   Init Tasks with 2
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array_Access : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type'(1,2,3,4,5,6);
    Tasks  : constant Integer := 2;
  begin  -- test case
    Put_Line ("(3)  Init Tasks with 2");
    begin  -- test part
      null;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Tasks = 2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:24 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:24 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 3.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (4)   Init Array with 2 Elements Int
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array_Access : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type'(1,2);
  begin  -- test case
    Put_Line ("(4)  Init Array with 2 Elements Int");
    begin  -- test part
      null;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_Array_Access'Length = 2
               and My_Array_Access(0) = 1
               and My_Array_Access(1) = 2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:33 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:33 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 4.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (5)   Init Array with 2 Elements Float
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Float,
                                                  "+" => "+");
    My_Array_Access : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type'(1.2, 2.1);
  begin  -- test case
    Put_Line ("(5)  Init Array with 2 Elements Float");
    begin  -- test part
      null;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_Array_Access'Length = 2
               and My_Array_Access(0) - 1.2 < Epsilon
               and My_Array_Access(1) - 2.1 < Epsilon
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:43 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:43 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 5.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (6)   Calc Sum 6 Elements Int
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array : My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..6);
    Result : Integer;
    Tasks  : constant Integer := 2;
  begin  -- test case
    Put_Line ("(6)  Calc Sum 6 Elements Int");
    begin  -- prepare part
      for I in 1..6 loop
          My_Array(I) := I;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 6.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = 21
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:53 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:53 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 6.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (7)   Calc Sum 6 Elements Float
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Float,
                                                  "+" => "+");
    My_Array : My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..6);
    Result : Float;
    Tasks  : constant Integer := 2;
  begin  -- test case
    Put_Line ("(7)  Calc Sum 6 Elements Float");
    begin  -- prepare part
      for I in 1..6 loop
          My_Array(I) := Float(I) + 0.3;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 7.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result - 22.8 < Epsilon
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:66 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:66 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 7.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (8)   Calc Sum 100 Elements Int
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..100);
    Result : Integer;
    Tasks : constant Integer := 2;
  begin  -- test case
    Put_Line ("(8)  Calc Sum 100 Elements Int");
    begin  -- prepare part
      for I in 1..100 loop
          My_Array(I) := 1;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 8.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = 100
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:79 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:79 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 8.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (9)   Calc Sum 100 Elements Float
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Float,
                                                  "+" => "+");
    My_Array : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..100);
    Result : Float;
    Tasks : constant Integer := 2;
  begin  -- test case
    Put_Line ("(9)  Calc Sum 100 Elements Float");
    begin  -- prepare part
      for I in 1..100 loop
          My_Array(I) := 1.1;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 9.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result - 110.0 < Epsilon
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:92 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:92 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 9.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (10)   Calc Sum 100 Elements Int 100 Tasks
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..100);
    Result : Integer;
    Tasks : constant Integer := 100;
  begin  -- test case
    Put_Line ("(10)  Calc Sum 100 Elements Int 100 Tasks");
    begin  -- prepare part
      for I in 1..100 loop
          My_Array(I) := 1;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 10.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = 100
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:105 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:105 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 10.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (11)   Calc Sum 100 Elements Float
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Float,
                                                  "+" => "+");
    My_Array : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..100);
    Result : Float;
    Tasks : constant Integer := 100;
  begin  -- test case
    Put_Line ("(11)  Calc Sum 100 Elements Float");
    begin  -- prepare part
      for I in 1..100 loop
          My_Array(I) := 1.1;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 11.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result - 110.0 < Epsilon
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:118 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:118 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 11.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (12)   Calc Sum 10000 Elements Int 100 Tasks
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..10000);
    Result : Integer;
    Tasks : constant Integer := 100;
  begin  -- test case
    Put_Line ("(12)  Calc Sum 10000 Elements Int 100 Tasks");
    begin  -- prepare part
      for I in 1..10000 loop
          My_Array(I) := 50;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 12.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = 500000
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:131 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:131 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 12.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (13)   Calc Sum Int'Last/2 Elements Int 100 Tasks (long process)
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..Integer'Last/2);
    Result : Integer;
    Tasks : constant Integer := 100;
  begin  -- test case
    Put_Line ("(13)  Calc Sum Int'Last/2 Elements Int 100 Tasks (long process)");
    begin  -- prepare part
      for I in 1..Integer'Last/2 loop
          My_Array(I) := 1;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 13.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = Integer'Last/2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:144 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:144 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 13.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (14)   Calc Sum negative int 100 tasks
  declare
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array : constant My_Par_Alg.Array_Access_Type :=
        new My_Par_Alg.Array_Type(1..500);
    Result : Integer;
    Tasks : constant Integer := 100;
  begin  -- test case
    Put_Line ("(14)  Calc Sum negative int 100 tasks");
    begin  -- prepare part
      for I in 1..500 loop
          My_Array(I) := -30;
      end loop;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 14.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result = -15000
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:157 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:157 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 14.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  --  End of test cases
  New_Line;
  Put ("Script name 'test.ts'");
  Put ("; total test result: ");
  if Driver_Internals.Fail_Result then
    Put ("FAIL");
    Driver_Internals.Status := 1;
  else
    Put ("pass");
    Driver_Internals.Status := 0;
  end if;
  Put_Line (".");
  New_Line;
  Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);

exception
  when Driver_Internals.Program_Terminate =>
    New_Line;
    Put ("Total test result: ");
    if Driver_Internals.Fail_Result then
      Put ("FAIL");
      Driver_Internals.Status := 1;
    else
      Put ("UNDEFINED");
      Driver_Internals.Status := -1;
    end if;
    if Driver_Internals.Unexpected_Error then
      Put_Line (",");
      Put_Line ("        there were one or more errors outside of test cases.");
      Driver_Internals.Status := -1;
    else
      Put_Line (".");
    end if;
    New_Line;
    Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);
  when E: others =>
    New_Line;
    Put_Line ("Unexpected exception " & Ada.Exceptions.Exception_Name (E) & " propagating out of driver.");
    Put_Line ("Results are undefined.");
    Driver_Internals.Status := -1;
    Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);

end test;
