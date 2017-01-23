context with Graph_Algorithms;
        with Graph;
        with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;
        with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
define  procedure My_Put_Char(Item : Character) is
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
code    Ada.Text_IO.Put_Line("Begin testing: ");

***** Check Shortest Path Char one edge
define  My_Graph : GIC.Graph_Type;
        Result : Integer := -2;
prepare GIC.Add_Vertex(My_Graph,'a');
        GIC.Add_Vertex(My_Graph,'b');
        GIC.Add_Edge(My_Graph,'a','b',1);
test    Result := GAC.Find_Shortest_Path(My_Graph,'a','b');
pass    Result /= -2 and Result /= -1 and Result = 1

***** Check Shortest Path Char three edges
define  My_Graph : GIC.Graph_Type;
        Result : Integer := -2;
prepare GIC.Add_Vertex(My_Graph,'a');
        GIC.Add_Vertex(My_Graph,'b');
        GIC.Add_Vertex(My_Graph,'c');
        GIC.Add_Edge(My_Graph,'a','b',1);
        GIC.Add_Edge(My_Graph,'b','c',2);
        GIC.Add_Edge(My_Graph,'a','c',4);
test    Result := GAC.Find_Shortest_Path(My_Graph,'a','c');
pass    Result /= -2 and Result /= -1 and Result = 3

***** Check Shortest Path Char greater graph
define  My_Graph : GIC.Graph_Type;
        Result : Integer := -2;
prepare GIC.Add_Vertex(My_Graph,'A');
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
test    Result := GAC.Find_Shortest_Path(My_Graph,'A','G');
pass    Result /= -2 and Result /= -1 and Result = 22

***** Check Shortest Path Int one edge
define  My_Graph : GII.Graph_Type;
        Result : Integer := -2;
prepare GII.Add_Vertex(My_Graph,1);
        GII.Add_Vertex(My_Graph,2);
        GII.Add_Edge(My_Graph,1,2,1);
test    Result := GAI.Find_Shortest_Path(My_Graph,1,2);
pass    Result /= -2 and Result /= -1 and Result = 1

***** Check Shortest Path Int three edges
define  My_Graph : GII.Graph_Type;
        Result : Integer := -2;
prepare GII.Add_Vertex(My_Graph,1);
        GII.Add_Vertex(My_Graph,2);
        GII.Add_Vertex(My_Graph,3);
        GII.Add_Edge(My_Graph,1,2,1);
        GII.Add_Edge(My_Graph,2,3,2);
        GII.Add_Edge(My_Graph,1,3,4);
test    Result := GAI.Find_Shortest_Path(My_Graph,1,3);
pass    Result /= -2 and Result /= -1 and Result = 3

***** Check Shortest Path Int greater graph
define  My_Graph : GII.Graph_Type;
        Result : Integer := -2;
prepare GII.Add_Vertex(My_Graph,1);
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
test    Result := GAI.Find_Shortest_Path(My_Graph,1,7);
pass    Result /= -2 and Result /= -1 and Result = 22

--------------------------------------------------------------------------------

***** Check Min Span Tree Char
define  My_Graph : GIC.Graph_Type;
        Result_Graph : GIC.Graph_Type;
prepare GIC.Add_Vertex(My_Graph,'a');
        GIC.Add_Vertex(My_Graph,'b');
        GIC.Add_Edge(My_Graph,'a','b',1);
test    Result_Graph := GAC.Find_Min_Spanning_Tree(My_Graph);
pass    Integer(GIC.Edge_Vectors.Length(Result_Graph.Edges)) = 1

***** Check Min Span Tree Char 3 edges
define  My_Graph : GIC.Graph_Type;
        Result_Graph : GIC.Graph_Type;
prepare GIC.Add_Vertex(My_Graph,'a');
        GIC.Add_Vertex(My_Graph,'b');
        GIC.Add_Vertex(My_Graph,'c');
        GIC.Add_Edge(My_Graph,'a','b',1);
        GIC.Add_Edge(My_Graph,'b','c',2);
        GIC.Add_Edge(My_Graph,'a','c',4);
test    Result_Graph := GAC.Find_Min_Spanning_Tree(My_Graph);
pass    Integer(GIC.Edge_Vectors.Length(Result_Graph.Edges)) = 2

***** Check Min Span Tree Char greater graph
define  My_Graph : GIC.Graph_Type;
        Result_Graph : GIC.Graph_Type;
prepare GIC.Add_Vertex(My_Graph,'A');
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
test    Result_Graph := GAC.Find_Min_Spanning_Tree(My_Graph);
pass    Integer(GIC.Edge_Vectors.Length(Result_Graph.Edges)) = 6

***** Check Min Span Tree Int 3 edges
define  My_Graph : GII.Graph_Type;
        Result_Graph : GII.Graph_Type;
prepare GII.Add_Vertex(My_Graph,1);
        GII.Add_Vertex(My_Graph,2);
        GII.Add_Vertex(My_Graph,3);
        GII.Add_Edge(My_Graph,1,2,1);
        GII.Add_Edge(My_Graph,2,3,2);
        GII.Add_Edge(My_Graph,1,3,4);
test    Result_Graph := GAI.Find_Min_Spanning_Tree(My_Graph);
pass    Integer(GII.Edge_Vectors.Length(Result_Graph.Edges)) = 2
