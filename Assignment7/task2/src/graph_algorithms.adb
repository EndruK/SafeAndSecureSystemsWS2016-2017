-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
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
        G_Copy : Graph_Type := G;
        -- Vertices : Vertex_Vectors.Vector := G.Vertices;
        Sorted_Edge_Vector : Edge_Vectors.Vector;
    begin
        -- copy the vertices
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
        -- edges are sorted

        -- put each vertex into its own subgraph and store the subgraphes
        -- in a vector
        declare
            -- Vector of graphes
            Graphes : Graph_Vectors.Vector;
        begin
            for I in First_Index(G.Vertices)..Last_Index(G.Vertices) loop
                declare
                    Sub_Graph : Graph_Type;
                begin
                    Add_Vertex(Sub_Graph,G.Vertices(I));
                    Append(Graphes,Sub_Graph);
                end;
            end loop;
            -- merge the subgraphes
            -- while Integer(Edge_Vectors.Length(Sorted_Edge_Vector)) > 0 loop
            while not Sorted_Edge_Vector.Is_Empty loop
                declare
                    -- get edge with lowest cost
                    Index : constant Integer := First_Index(Sorted_Edge_Vector);
                    Edge : constant Edge_Type := Sorted_Edge_Vector(Index);
                    From_Graph : Graph_Type;
                    From_Graph_Index : Integer;
                    To_Graph : Graph_Type;
                    To_Graph_Index : Integer;
                begin
                    -- remove edge from sorted list
                    Sorted_Edge_Vector.Delete(Index);
                    -- get subgraphs each containing from or to
                    for I in First_Index(Graphes)..Last_Index(Graphes) loop
                        -- get the subgraph of the from node
                        if Graph_Contains_Vertex(Graphes(I), Edge.From) then
                            From_Graph := Graphes(I);
                            From_Graph_Index := I;
                        end if;
                        -- get the subgraph of the to node
                        if Graph_Contains_Vertex(Graphes(I), Edge.To) then
                            To_Graph := Graphes(I);
                            To_Graph_Index := I;
                        end if;
                    end loop;
                    -- check if the graphes are equal
                    -- if not Equals(From_Graph, To_Graph) then
                    if From_Graph_Index /= To_Graph_Index then
                        -- merge graphes
                        Merge_Graphs(From_Graph, To_Graph); -- merges to into from
                        Graphes.Delete(To_Graph_Index); -- remove from graphes set
                        From_Graph.Add_Edge(Edge); -- add the actual edge to left set
                    end if; -- otherwise do nothing
                end;
            end loop;
            declare
                Result : Graph_Type;
            begin
                Result := Graphes(Last_Index(Graphes));
                -- Put(Integer(Vertex_Vectors.Length(Result.Vertices)));
                return Result;
            end;
        end;
        -- return Min_Span_Tree;
    end Find_Min_Spanning_Tree;

--------------------------------------------------------------------------------

    function Equals(Left : in Graph_Type; Right : in Graph_Type) return Boolean is
        Left_Vertices : constant Vertex_Array := To_Vertex_Array(Left);
        Right_Vertices : constant Vertex_Array := To_Vertex_Array(Right);
    begin
        for I in Left_Vertices'Range loop
            for J in Right_Vertices'Range loop
                Put_Vertex(Right_Vertices(J));
                if Left_Vertices(I) = Right_Vertices(J) then
                    -- Put_Vertex(Left_Vertices(I));
                    -- Put_Vertex(Right_Vertices(J));
                    return True;
                end if;
            end loop;
        end loop;
        return False;
    end Equals;
--------------------------------------------------------------------------------

    function Graph_Contains_Vertex(G: Graph_Type;
                                   V: Vertex_Type) return Boolean is
    begin
        for I in First_Index(G.Vertices)..Last_Index(G.Vertices) loop
            if G.Vertices(I) = V then
                return True;
            end if;
        end loop;
        return False;
    end Graph_Contains_Vertex;

--------------------------------------------------------------------------------

    procedure Merge_Graphs(From_Graph : in out Graph_Type; To_Graph : in Graph_Type) is
        Vertex : Vertex_Type;
    begin
        -- Merge does not work like it is supposed to work :(
        for I in First_Index(To_Graph.Vertices)..Last_Index(To_Graph.Vertices) loop
            Vertex := To_Graph.Vertices(I);
            Add_Vertex(From_Graph, Vertex);
        end loop;
    end Merge_Graphs;

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
