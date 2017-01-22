-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       /home/andre/Github/SafeAndSecureSystemsWS2016-2017/Assignment7/task2/tests/test.adb
  -- Script:     /home/andre/Github/SafeAndSecureSystemsWS2016-2017/Assignment7/task2/tests/test.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Graph_Algorithms;
with Graph;
with Ada.Assertions; use Ada.Assertions;
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
  package My_Graph_Instance_Char is new Graph(Vertex_Type => Character, "=" => "=", Put_Vertex => My_Put_Char);
  package My_Graph_Instance_Int is new Graph(Vertex_Type => Integer, "=" => "=", Put_Vertex => My_Put_Int);
  package My_Graph_Alg_Char is new Graph_Algorithms(Vertex_Type => Character, "=" => "=", Put_Vertex => My_Put_Char, Graph_Instance => My_Graph_Instance_Char);
  package My_Graph_Alg_Int is new Graph_Algorithms(Vertex_Type => Integer, "=" => "=", Put_Vertex => My_Put_Int, Graph_Instance => My_Graph_Instance_Int);
  package GIC renames My_Graph_Instance_Char;
  package GII renames My_Graph_Instance_Int;
  package GAC renames My_Graph_Alg_Char;
  package GAI renames My_Graph_Alg_Int;

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

  -- Test Case (1)   Check Shortest Path Char one edge
  declare
    My_Graph : GIC.Graph_Type;
    Result : Integer := -2;
  begin  -- test case
    Put_Line ("(1)  Check Shortest Path Char one edge");
    begin  -- prepare part
      GIC.Add_Vertex(My_Graph,'a');
      GIC.Add_Vertex(My_Graph,'b');
      GIC.Add_Edge(My_Graph,'a','b',1);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 1.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := GAC.Find_Shortest_Path(My_Graph,'a','b');
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result /= -2 and Result /= -1 and Result = 1
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
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 1.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (2)   Check Shortest Path Char three edges
  declare
    My_Graph : GIC.Graph_Type;
    Result : Integer := -2;
  begin  -- test case
    Put_Line ("(2)  Check Shortest Path Char three edges");
    begin  -- prepare part
      GIC.Add_Vertex(My_Graph,'a');
      GIC.Add_Vertex(My_Graph,'b');
      GIC.Add_Vertex(My_Graph,'c');
      GIC.Add_Edge(My_Graph,'a','b',1);
      GIC.Add_Edge(My_Graph,'b','c',2);
      GIC.Add_Edge(My_Graph,'a','c',4);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 2.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := GAC.Find_Shortest_Path(My_Graph,'a','c');
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result /= -2 and Result /= -1 and Result = 3
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
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 2.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (3)   Check Shortest Path Char greater graph
  declare
    My_Graph : GIC.Graph_Type;
    Result : Integer := -2;
  begin  -- test case
    Put_Line ("(3)  Check Shortest Path Char greater graph");
    begin  -- prepare part
      GIC.Add_Vertex(My_Graph,'A');
      GIC.Add_Vertex(My_Graph,'B');
      GIC.Add_Vertex(My_Graph,'C');
      GIC.Add_Vertex(My_Graph,'D');
      GIC.Add_Vertex(My_Graph,'E');
      GIC.Add_Vertex(My_Graph,'F');
      GIC.Add_Vertex(My_Graph,'G');
      GIC.Add_Edge(My_Graph, 'A', 'B', 7);
      GIC.Add_Edge(My_Graph, 'A', 'D', 5);
      GIC.Add_Edge(My_Graph, 'B', 'D', 9);
      GIC.Add_Edge(My_Graph, 'B', 'C', 8);
      GIC.Add_Edge(My_Graph, 'B', 'E', 7);
      GIC.Add_Edge(My_Graph, 'C', 'E', 5);
      GIC.Add_Edge(My_Graph, 'D', 'E', 15);
      GIC.Add_Edge(My_Graph, 'D', 'F', 6);
      GIC.Add_Edge(My_Graph, 'E', 'F', 8);
      GIC.Add_Edge(My_Graph, 'F', 'G', 11);
      GIC.Add_Edge(My_Graph, 'E', 'G', 9);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 3.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := GAC.Find_Shortest_Path(My_Graph,'A','G');
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result /= -2 and Result /= -1 and Result = 22
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:45 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:45 ");
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

  -- Test Case (4)   Check Shortest Path Int one edge
  declare
    My_Graph : GII.Graph_Type;
    Result : Integer := -2;
  begin  -- test case
    Put_Line ("(4)  Check Shortest Path Int one edge");
    begin  -- prepare part
      GII.Add_Vertex(My_Graph,1);
      GII.Add_Vertex(My_Graph,2);
      GII.Add_Edge(My_Graph,1,2,1);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 4.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := GAI.Find_Shortest_Path(My_Graph,1,2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result /= -2 and Result /= -1 and Result = 1
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:69 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:69 ");
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

  -- Test Case (5)   Check Shortest Path Int three edges
  declare
    My_Graph : GII.Graph_Type;
    Result : Integer := -2;
  begin  -- test case
    Put_Line ("(5)  Check Shortest Path Int three edges");
    begin  -- prepare part
      GII.Add_Vertex(My_Graph,1);
      GII.Add_Vertex(My_Graph,2);
      GII.Add_Vertex(My_Graph,3);
      GII.Add_Edge(My_Graph,1,2,1);
      GII.Add_Edge(My_Graph,2,3,2);
      GII.Add_Edge(My_Graph,1,3,4);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 5.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := GAI.Find_Shortest_Path(My_Graph,1,3);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result /= -2 and Result /= -1 and Result = 3
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:78 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:78 ");
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

  -- Test Case (6)   Check Shortest Path Int greater graph
  declare
    My_Graph : GII.Graph_Type;
    Result : Integer := -2;
  begin  -- test case
    Put_Line ("(6)  Check Shortest Path Int greater graph");
    begin  -- prepare part
      GII.Add_Vertex(My_Graph,1);
      GII.Add_Vertex(My_Graph,2);
      GII.Add_Vertex(My_Graph,3);
      GII.Add_Vertex(My_Graph,4);
      GII.Add_Vertex(My_Graph,5);
      GII.Add_Vertex(My_Graph,6);
      GII.Add_Vertex(My_Graph,7);
      GII.Add_Edge(My_Graph, 1, 2, 7);
      GII.Add_Edge(My_Graph, 1, 4, 5);
      GII.Add_Edge(My_Graph, 2, 4, 9);
      GII.Add_Edge(My_Graph, 2, 3, 8);
      GII.Add_Edge(My_Graph, 2, 5, 7);
      GII.Add_Edge(My_Graph, 3, 5, 5);
      GII.Add_Edge(My_Graph, 4, 5, 15);
      GII.Add_Edge(My_Graph, 4, 6, 6);
      GII.Add_Edge(My_Graph, 5, 6, 8);
      GII.Add_Edge(My_Graph, 6, 7, 11);
      GII.Add_Edge(My_Graph, 5, 7, 9);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 6.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result := GAI.Find_Shortest_Path(My_Graph,1,7);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Result /= -2 and Result /= -1 and Result = 22
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:90 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:90 ");
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

  -- Test Case (7)   Check Min Span Tree Char
  declare
    My_Graph : GIC.Graph_Type;
    Result_Graph : GIC.Graph_Type;
  begin  -- test case
    Put_Line ("(7)  Check Min Span Tree Char");
    begin  -- prepare part
      GIC.Add_Vertex(My_Graph,'a');
      GIC.Add_Vertex(My_Graph,'b');
      GIC.Add_Edge(My_Graph,'a','b',1);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 7.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result_Graph := GAC.Find_Min_Spanning_Tree(My_Graph);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer(GIC.Edge_Vectors.Length(Result_Graph.Edges)) = 1
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:116 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:116 ");
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

  -- Test Case (8)   Check Min Span Tree Char 3 edges
  declare
    My_Graph : GIC.Graph_Type;
    Result_Graph : GIC.Graph_Type;
  begin  -- test case
    Put_Line ("(8)  Check Min Span Tree Char 3 edges");
    begin  -- prepare part
      GIC.Add_Vertex(My_Graph,'a');
      GIC.Add_Vertex(My_Graph,'b');
      GIC.Add_Vertex(My_Graph,'c');
      GIC.Add_Edge(My_Graph,'a','b',1);
      GIC.Add_Edge(My_Graph,'b','c',2);
      GIC.Add_Edge(My_Graph,'a','c',4);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 8.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result_Graph := GAC.Find_Min_Spanning_Tree(My_Graph);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer(GIC.Edge_Vectors.Length(Result_Graph.Edges)) = 2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:125 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:125 ");
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

  -- Test Case (9)   Check Min Span Tree Char greater graph
  declare
    My_Graph : GIC.Graph_Type;
    Result_Graph : GIC.Graph_Type;
  begin  -- test case
    Put_Line ("(9)  Check Min Span Tree Char greater graph");
    begin  -- prepare part
      GIC.Add_Vertex(My_Graph,'A');
      GIC.Add_Vertex(My_Graph,'B');
      GIC.Add_Vertex(My_Graph,'C');
      GIC.Add_Vertex(My_Graph,'D');
      GIC.Add_Vertex(My_Graph,'E');
      GIC.Add_Vertex(My_Graph,'F');
      GIC.Add_Vertex(My_Graph,'G');
      GIC.Add_Edge(My_Graph, 'A', 'B', 7);
      GIC.Add_Edge(My_Graph, 'A', 'D', 5);
      GIC.Add_Edge(My_Graph, 'B', 'D', 9);
      GIC.Add_Edge(My_Graph, 'B', 'C', 8);
      GIC.Add_Edge(My_Graph, 'B', 'E', 7);
      GIC.Add_Edge(My_Graph, 'C', 'E', 5);
      GIC.Add_Edge(My_Graph, 'D', 'E', 15);
      GIC.Add_Edge(My_Graph, 'D', 'F', 6);
      GIC.Add_Edge(My_Graph, 'E', 'F', 8);
      GIC.Add_Edge(My_Graph, 'F', 'G', 11);
      GIC.Add_Edge(My_Graph, 'E', 'G', 9);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 9.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result_Graph := GAC.Find_Min_Spanning_Tree(My_Graph);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer(GIC.Edge_Vectors.Length(Result_Graph.Edges)) = 6
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:137 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:137 ");
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

  -- Test Case (10)   Check Min Span Tree Int 3 edges
  declare
    My_Graph : GII.Graph_Type;
    Result_Graph : GII.Graph_Type;
  begin  -- test case
    Put_Line ("(10)  Check Min Span Tree Int 3 edges");
    begin  -- prepare part
      GII.Add_Vertex(My_Graph,1);
      GII.Add_Vertex(My_Graph,2);
      GII.Add_Vertex(My_Graph,3);
      GII.Add_Edge(My_Graph,1,2,1);
      GII.Add_Edge(My_Graph,2,3,2);
      GII.Add_Edge(My_Graph,1,3,4);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 10.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Result_Graph := GAI.Find_Min_Spanning_Tree(My_Graph);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer(GII.Edge_Vectors.Length(Result_Graph.Edges)) = 2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("      ...pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("           Script name:'test.ts'; Line:161 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("           Script name:'test.ts'; Line:161 ");
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
