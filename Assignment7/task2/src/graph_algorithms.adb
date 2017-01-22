with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Graph_Algorithms is


    function Find_Shortest_Path(G: Graph_Type;
                                From: Vertex_Type;
                                To: Vertex_Type) return Integer is
        Vertices : constant Vertex_Array := To_Vertex_Array(G);
        Distances : array(Vertices'Range) of Integer;
        Result_G : Graph_Type;
    begin
        for I in Distances'Range loop
            if Vertices(I) = From then
                Distances(I) := 0;
            else
                Distances(I) := Integer'Last;
            end if;
        end loop;

        while(To_Vertex_Array(Result_G)'Length < Vertices'Length) loop
            declare
                Cur_Vertex, Min_Vertex, Neighbour_Vertex : Vertex_Type;
                Cur_Dist, Min_Dist, Neighbour_Dist : Integer;
            begin
                Min_Dist := Integer'Last;
                for I in Vertices'Range loop
                    Cur_Vertex := G.Vertices(I);
                    Cur_Dist := Distances(I);
                    if Cur_Dist <= Min_Dist and
                            not Result_G.Vertices.contains(Cur_Vertex) then
                        Min_Vertex := Cur_Vertex;
                        Min_Dist := Cur_Dist;
                    end if;
                end loop;
                Result_G.Add_Vertex(Min_Vertex);

                for I in Vertices'Range loop
                    Neighbour_Vertex := G.Vertices(I);
                    if Has_Edge(G, Min_Vertex, Neighbour_Vertex) then
                        Neighbour_Dist := Distances(I);
                        declare
                            Weight : constant Integer :=
                                Get_Edge_Weight(G, Min_Vertex, Neighbour_Vertex);
                            New_Weight : constant Integer := Min_Dist + Weight;
                        begin
                            if(New_Weight < Neighbour_Dist) then
                                Distances(I) := New_Weight;
                            end if;
                        end;
                    end if;
                end loop;
            end;
        end loop;
        for I in Distances'Range loop
            if Vertices(I) = To and Distances(i) < Integer'Last then
                return Distances(I);
            end if;
        end loop;
        return -1;
    end Find_Shortest_Path;
--------------------------------------------------------------------------------
    function Find_Min_Spanning_Tree(G: Graph_Type) return Graph_Type is
        Min_Span_Tree : Graph_Type;
        G_Copy : Graph_Type := G;
        -- Vertices : Vertex_Vectors.Vector := G.Vertices;
        Sorted_Edge_Vector : Edge_Vectors.Vector;
    begin
        -- copy the vertices
        Min_Span_Tree.Vertices := G.Vertices;
        -- sort edges
        declare
            Temp_Edge : Edge_Type :=
                G_Copy.Edges.Element(First_Index(G_Copy.Edges));
            Index : Integer := First_Index(G_Copy.Edges);
            Check_Weight : Integer := Integer'Last;
        begin
            while Integer(Edge_Vectors.Length(G_Copy.Edges)) > 0 loop
                Check_Weight := Integer'Last;
                for I in First_Index(G_Copy.Edges)..Last_Index(G_Copy.Edges) loop
                    if G_Copy.Edges.Element(I).Weight < Check_Weight then
                        Temp_Edge := G_Copy.Edges.Element(I);
                        Check_Weight := Temp_Edge.Weight;
                        Index := I;
                    end if;
                end loop;
                G_Copy.Edges.Delete(Index);
                Append(Sorted_Edge_Vector,Temp_Edge);
            end loop;
        end;

        while Integer(Edge_Vectors.Length(Sorted_Edge_Vector)) > 0 loop
            declare
                Index : constant Integer := First_Index(Sorted_Edge_Vector);
                Edge : constant Edge_Type := Sorted_Edge_Vector.Element(Index);
                Temp_Graph : Graph_Type := Min_Span_Tree;
            begin
                Sorted_Edge_Vector.Delete(Index);
                Add_Edge(Temp_Graph, Edge);
                Print_Edges(Temp_Graph);
                Put_Line("");
                Put_Line("");
                if not Has_Loop(Temp_Graph) then
                    Add_Edge(Min_Span_Tree, Edge);
                end if;
            end;
        end loop;
        Put_Line("------------------");
        return Min_Span_Tree;
    end Find_Min_Spanning_Tree;

--------------------------------------------------------------------------------

    function Has_Loop(G : Graph_Type) return Boolean is
        Result : Boolean := False;
        Visited_Vertices : Vertex_Vectors.Vector;
    begin -- Has_Loop
        for I in First_Index(G.Edges)..Last_Index(G.Edges) loop
            -- yeaaah here comes a loop because not recursively
            if not Visited_Vertices.contains(G.Edges(I).From) then
                Append(Visited_Vertices, G.Edges(i).From);
            elsif not Visited_Vertices.contains(G.Edges(I).To) then
                Append(Visited_Vertices, G.Edges(I).To);
            else
                -- declare
                --     Temp_Graph : Graph_Type := G;
                --     Current_Vertex_From : Vertex_Type := G.Edges(I).From;
                --     Current_Vertex_To : Vertex_Type := G.Edges(I).To;
                -- begin
                --     -- remove the edge
                --     if Remove_Edge(Temp_Graph,
                --                    Current_Vertex_From,
                --                    Current_Vertex_To) then
                --         for J in First_Index(Temp_Graph.Edges)..
                --                  Last_Index(Temp_Graph.Edges) loop
                --             if Temp_Graph.Edges(J).From = Current_Vertex_From or
                --                Temp_Graph.Edges(J).To = Current_Vertex_To     or
                --                Temp_Graph.Edges(J).From = Current_Vertex_To   or
                --                Temp_Graph.Edges(J).To = Current_Vertex_From then
                --                 Result := True;
                --                 exit;
                --             end if;
                --         end loop;
                --     end if;
                -- end;
                Result := True;
                Result := True;
            end if;
        end loop;
        return Result;
    end Has_Loop;

--------------------------------------------------------------------------------
    procedure Print_Edges(G: Graph_Type) is
        Edge : Edge_Type;
    begin
        for I in First_Index(G.Edges) .. Last_Index(G.Edges) loop
            Edge := G.Edges.Element(I);
            Put_Vertex(Edge.From);
            Put("->");
            Put_Vertex(Edge.To);
            Put("  ");
            Put(Edge.Weight);
            Put_Line("");
        end loop;
    end Print_Edges;
end Graph_Algorithms;
