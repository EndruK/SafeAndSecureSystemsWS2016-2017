-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       /home/andre/Github/SafeAndSecureSystemsWS2016-2017/BonusAssignment/task1/tests/test.adb
  -- Script:     /home/andre/Github/SafeAndSecureSystemsWS2016-2017/BonusAssignment/task1/tests/test.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Lists;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

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
  procedure My_Put_Char(Item : Character) is
  begin
      Put(Item);
  end My_Put_Char;
  procedure My_Put_Int(Item : Integer) is
  begin
      Put(Item, Width => 10);
  end My_Put_Int;
  package My_List_Instance_Char is new Lists(Item_Type => Character, Put_Item => My_Put_Char);
  package My_List_Instance_Int is new Lists(Item_Type => Integer, Put_Item => My_Put_Int);
  package LC renames My_List_Instance_Char;
  package LI renames My_List_Instance_Int;

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

  -- Test Case (1)   append nothing to list
  declare
    My_List : LI.List_Type;
    Error_Thrown_First : Boolean := False;
    Error_Thrown_Last : Boolean := False;
    Iterator : LI.List_Iterator_Type_Acc;
  begin  -- test case
    Put_Line ("(1)  append nothing to list");
    begin  -- test part
      begin
          Iterator := LI.First(My_List);
      exception
          when LI.Iterator_Error => Error_Thrown_First := True;
      end;
      begin
          Iterator := LI.Last(My_List);
      exception
          when LI.Iterator_Error => Error_Thrown_Last := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Error_Thrown_First and Error_Thrown_Last
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:18 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:18 ");
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

  -- Test Case (2)   append element to list
  declare
    My_List : LI.List_Type;
    Iterator : LI.List_Iterator_Type_Acc;
    Element : constant Integer := 2;
    Size : Natural;
    Result_First : Integer;
    Result_Last : Integer;
    Error_Thrown_First_Succ : Boolean := False;
    Error_Thrown_Last_Pred : Boolean := False;
  begin  -- test case
    Put_Line ("(2)  append element to list");
    begin  -- test part
      LI.Append(My_List, Element);
      Size := LI.Size(My_List);
      Result_First := LI.Value(LI.First(My_List));
      Result_Last := LI.Value(LI.Last(My_List));
      begin
          Iterator := LI.Succ(LI.First(My_List));
      exception
          when LI.Iterator_Error => Error_Thrown_First_Succ := True;
      end;
      begin
          Iterator := LI.Pred(LI.Last(My_List));
      exception
          when LI.Iterator_Error => Error_Thrown_Last_Pred := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 1 and Result_First = Element and Result_First = Result_Last
           and Error_Thrown_First_Succ and Error_Thrown_Last_Pred
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:35 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:35 ");
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

  -- Test Case (3)   Append Char to List
  declare
    My_List : LC.List_Type;
    Iterator : LC.List_Iterator_Type_Acc;
    Element : constant Character := 'c';
    Size : Natural;
    Result_First : Character;
    Result_Last : Character;
    Error_Thrown_First_Succ : Boolean := False;
    Error_Thrown_Last_Pred : Boolean := False;
  begin  -- test case
    Put_Line ("(3)  Append Char to List");
    begin  -- test part
      LC.Append(My_List, Element);
      Size := LC.Size(My_List);
      Result_First := LC.Value(LC.First(My_List));
      Result_Last := LC.Value(LC.Last(My_List));
      begin
          Iterator := LC.Succ(LC.First(My_List));
      exception
          when LC.Iterator_Error => Error_Thrown_First_Succ := True;
      end;
      begin
          Iterator := LC.Pred(LC.Last(My_List));
      exception
          when LC.Iterator_Error => Error_Thrown_Last_Pred := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 1 and Result_First = Element and Result_First = Result_Last
           and Error_Thrown_First_Succ and Error_Thrown_Last_Pred
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:61 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:61 ");
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

  -- Test Case (4)   Append multiple elements to list
  declare
    My_List : LI.List_Type;
    type My_Array_Type is array(Natural range 1..5) of Integer;
    Elements : constant My_Array_Type := (20, 5, 2, 103, 9);
    Size : Natural;
    Result_First, Result_Sec, Result_Third,
        Result_Fourth, Result_Last : Integer;
  begin  -- test case
    Put_Line ("(4)  Append multiple elements to list");
    begin  -- test part
      LI.Append(My_List, Elements(1));
      LI.Append(My_List, Elements(2));
      LI.Append(My_List, Elements(3));
      LI.Append(My_List, Elements(4));
      LI.Append(My_List, Elements(5));
      Size := LI.Size(My_List);
      Result_First := LI.Value(LI.First(My_List));
      Result_Sec := LI.Value(LI.Succ(LI.First(My_List)));
      Result_Third := LI.Value(LI.Succ(LI.Succ(LI.First(My_List))));
      Result_Fourth := LI.Value(LI.Pred(LI.Last(My_List)));
      Result_Last := LI.Value(LI.Last(My_List));
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 5 and Result_First = Elements(1) and Result_Sec = Elements(2)
           and Result_Third = Elements(3) and Result_Fourth = Elements(4)
           and Result_Last = Elements(5)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:87 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:87 ");
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

  -- Test Case (5)   Prepend test
  declare
    My_List : LI.List_Type;
    Size : Natural;
  begin  -- test case
    Put_Line ("(5)  Prepend test");
    begin  -- test part
      LI.Append(My_List, 2);
      LI.Prepend(My_List, 132);
      Size := LI.Size(My_List);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 2 and LI.Value(LI.First(My_List)) = 132 and LI.Value(LI.Last(My_List)) = 2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:109 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:109 ");
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

  -- Test Case (6)   Prepend test 2
  declare
    My_List : LI.List_Type;
    Size : Natural;
  begin  -- test case
    Put_Line ("(6)  Prepend test 2");
    begin  -- test part
      LI.Append(My_List, 1);
      LI.Append(My_List, 2);
      LI.Append(My_List, 3);
      LI.Prepend(My_List, 132);
      Size := LI.Size(My_List);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 4 and LI.Value(LI.First(My_List)) = 132 and LI.Value(LI.Last(My_List)) = 3
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:117 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:117 ");
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

  -- Test Case (7)   Get First Test
  declare
    My_List : LI.List_Type;
    Size : Natural;
  begin  -- test case
    Put_Line ("(7)  Get First Test");
    begin  -- test part
      LI.Prepend(My_List, 4);
      LI.Append(My_List, 1);
      LI.Append(My_List, 2);
      LI.Prepend(My_List, 5);
      LI.Prepend(My_List, 6);
      LI.Append(My_List, 3);
      Size := LI.Size(My_List);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 6 and LI.Value(LI.First(My_List)) = 6
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:127 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:127 ");
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

  -- Test Case (8)   Get Last Test
  declare
    My_List : LI.List_Type;
    Size : Natural;
  begin  -- test case
    Put_Line ("(8)  Get Last Test");
    begin  -- test part
      LI.Prepend(My_List, 4);
      LI.Append(My_List, 1);
      LI.Prepend(My_List, 5);
      LI.Append(My_List, 2);
      LI.Append(My_List, 3);
      LI.Prepend(My_List, 6);
      Size := LI.Size(My_List);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 6 and LI.Value(LI.Last(My_List)) = 3
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:139 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:139 ");
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

  -- Test Case (9)   Get Succ of Item
  declare
    My_List : LI.List_Type;
    Size : Natural;
    Iterator : LI.List_Iterator_Type_Acc;
  begin  -- test case
    Put_Line ("(9)  Get Succ of Item");
    begin  -- test part
      LI.Append(My_List, 3);
      LI.Append(My_List, 31);
      LI.Append(My_List, 65);
      LI.Append(My_List, 6);
      LI.Append(My_List, 62);
      Iterator := LI.First(My_List);
      declare
          Temp : constant LI.List_Iterator_Type_Acc := LI.Succ(Iterator);
      begin
          Iterator := Temp;
      end;
      Size := LI.Size(My_List);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 5 and LI.Value(Iterator) = 31
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:151 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:151 ");
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

  -- Test Case (10)   Get Pred of Item
  declare
    My_List : LI.List_Type;
    Size : Natural;
    Iterator : LI.List_Iterator_Type_Acc;
  begin  -- test case
    Put_Line ("(10)  Get Pred of Item");
    begin  -- test part
      LI.Append(My_List, 3);
      LI.Append(My_List, 31);
      LI.Append(My_List, 65);
      LI.Append(My_List, 6);
      LI.Append(My_List, 62);
      Iterator := LI.Last(My_List);
      declare
          Temp : constant LI.List_Iterator_Type_Acc := LI.Pred(Iterator);
      begin
          Iterator := Temp;
      end;
      Size := LI.Size(My_List);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 5 and LI.Value(Iterator) = 6
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:169 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:169 ");
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

  -- Test Case (11)   Test insert
  declare
    My_List : LI.List_Type;
    Size : Natural;
    Iterator : LI.List_Iterator_Type_Acc;
  begin  -- test case
    Put_Line ("(11)  Test insert");
    begin  -- prepare part
      LI.Append(My_List, 1);
      LI.Append(My_List, 2);
      LI.Append(My_List, 3);
      LI.Append(My_List, 4);
      LI.Append(My_List, 5);
      LI.Append(My_List, 6);
      LI.Append(My_List, 7);
      LI.Append(My_List, 8);
      LI.Append(My_List, 9);
      Iterator := LI.Succ(LI.Succ(LI.Succ(LI.First(My_List))));
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 11.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      LI.Insert(My_List, Iterator, 999);
      Size := LI.Size(My_List);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if LI.Value(LI.Succ(LI.Succ(LI.Succ(LI.First(My_List))))) = 999
           and LI.Value(LI.Succ(LI.Succ(LI.First(My_List)))) = 3
           and LI.Value(LI.Succ(LI.Succ(LI.Succ(LI.Succ(LI.First(My_List)))))) = 4
           and Size = 10
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:187 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:187 ");
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

  -- Test Case (12)   Test Delete
  declare
    My_List : LI.List_Type;
    Iterator : LI.List_Iterator_Type_Acc;
    Size : Natural;
  begin  -- test case
    Put_Line ("(12)  Test Delete");
    begin  -- prepare part
      LI.Append(My_List,2);
      Iterator := LI.First(My_List);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 12.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      LI.Delete(My_List, Iterator);
      Size := LI.Size(My_List);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Size = 0
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:208 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:208 ");
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
