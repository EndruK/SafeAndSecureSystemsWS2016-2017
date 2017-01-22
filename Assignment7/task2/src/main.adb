-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Graph_Algorithms;
with Graph;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
    procedure My_Put(Item : Character) is
    begin
        -- Put(Item, Width => 0);
        Put(Item);
    end My_Put;
    package My_Graph_Instance is new Graph(Vertex_Type => Character,
                                           "=" => "=",
                                           Put_Vertex => My_Put);
    package My_Graph_Alg is new Graph_Algorithms(Vertex_Type => Character,
                                                 "=" => "=",
                                                 Put_Vertex => My_Put,
                                                 Graph_Instance => My_Graph_Instance);
    My_Graph : My_Graph_Instance.Graph_Type;
    Result_Graph : My_Graph_Instance.Graph_Type;
begin -- Main
    My_Graph_Instance.Add_Vertex(My_Graph, 'a');
    My_Graph_Instance.Add_Vertex(My_Graph, 'b');
    My_Graph_Instance.Add_Vertex(My_Graph, 'c');
    My_Graph_Instance.Add_Vertex(My_Graph, 'd');

    My_Graph_Instance.Add_Edge(My_Graph, 'a', 'b', 1);
    My_Graph_Instance.Add_Edge(My_Graph, 'b', 'c', 2);
    My_Graph_Instance.Add_Edge(My_Graph, 'a', 'c', 4);
    Put_Line("");
    Put(My_Graph_Alg.Find_Shortest_Path(My_Graph, 'a', 'c'));
    Put_Line("");
    -- Put(My_Graph_Alg.Find_Shortest_Path(My_Graph, 'a', 'c'));

    -- My_Graph_Instance.Add_Vertex(My_Graph, 'A');
    -- My_Graph_Instance.Add_Vertex(My_Graph, 'B');
    -- My_Graph_Instance.Add_Vertex(My_Graph, 'C');
    -- My_Graph_Instance.Add_Vertex(My_Graph, 'D');
    -- My_Graph_Instance.Add_Vertex(My_Graph, 'E');
    -- My_Graph_Instance.Add_Vertex(My_Graph, 'F');
    -- My_Graph_Instance.Add_Vertex(My_Graph, 'G');

    -- My_Graph_Instance.Add_Edge(My_Graph, 'A', 'B', 7);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'A', 'D', 5);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'B', 'D', 9);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'B', 'C', 8);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'B', 'E', 7);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'C', 'E', 5);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'D', 'E', 15);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'D', 'F', 6);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'E', 'F', 8);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'F', 'G', 11);
    -- My_Graph_Instance.Add_Edge(My_Graph, 'E', 'G', 9);


    Result_Graph := My_Graph_Alg.Find_Min_Spanning_Tree(My_Graph);
    My_Graph_Alg.Print_Edges(My_Graph);
    Put_Line("");
    My_Graph_Alg.Print_Edges(Result_Graph);
end Main;
