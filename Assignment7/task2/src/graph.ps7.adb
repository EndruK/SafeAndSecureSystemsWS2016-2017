package body Graph is

    procedure Add_Vertex(G: in out Graph_Type; Vertex: Vertex_Type) is 
    begin
        for I In First_Index(G.Vertices) .. Last_Index(G.Vertices) loop
            if Vertex = G.Vertices.Element(I) then
                raise Vertex_Already_In_Graph_Exception;
            end if;
        end loop;
        
        Append(G.Vertices, Vertex);
    end Add_Vertex;
    
    -- ---------------------------------------------------------------

    procedure Add_Edge(G: in out Graph_Type; 
                       From: Vertex_Type; 
                       To: Vertex_Type; 
                       Weight: Integer) is
        Edge: Edge_Type;
    begin
        for I in First_Index(G.Edges) .. Last_Index(G.Edges) loop
            Edge := G.Edges.Element(I);
            
            if Edge.From = From and Edge.To = To then
                Edge.Weight := Weight;
                G.Edges.Replace_Element(I, Edge);
                return;
            end if;
        end loop;
        
        Edge := Edge_Type'(From, To, Weight);
        Append(G.Edges, Edge);
    end Add_Edge;
    
    -- ---------------------------------------------------------------

    procedure Clear(G: in out Graph_Type) is
    begin
        Clear(G.Vertices);
        Clear(G.Edges);
    end Clear;
    
    -- ---------------------------------------------------------------

    function Get_Edge_Weight(G: Graph_Type; From: Vertex_Type; To: Vertex_Type) 
        return Integer 
    is
        Edge: Edge_Type;
    begin
        for I in First_Index(G.Edges) .. Last_Index(G.Edges) loop
            Edge := G.Edges.Element(I);
            
            if Edge.From = From and Edge.To = To then
                return Edge.Weight;
            end if;
        end loop;
        
        raise Edge_Not_Found_Exception;
    end Get_Edge_Weight;
    
    -- ---------------------------------------------------------------

    function Has_Edge(G: Graph_Type; From: Vertex_Type; To: Vertex_Type) 
        return Boolean is
        Edge: Edge_Type;
    begin
        for I in First_Index(G.Edges) .. Last_Index(G.Edges) loop
            Edge := G.Edges.Element(I);
            
            if Edge.From = From and Edge.To = To then
                return True;
            end if;
        end loop;
        
        return False;
    end Has_Edge;
    
    -- ---------------------------------------------------------------

    function Remove_Edge(G: in out Graph_Type; 
                         From: Vertex_Type; 
                         To: Vertex_Type) return Boolean is
        Edge: Edge_Type;
    begin
        for I in First_Index(G.Edges) .. Last_Index(G.Edges) loop
            Edge := G.Edges.Element(I);
            
            if Edge.From = From and Edge.To = To then
                return True;
            end if;
        end loop;
        
        return False;
    end Remove_Edge;
    
    -- ---------------------------------------------------------------

    function To_Vertex_Array(G: Graph_Type) return Vertex_Array is
        Result: Vertex_Array(0 .. Integer(Length(G.Vertices)) - 1);
        J: Natural := 0;
    begin
        for I in First_Index(G.Vertices) .. Last_Index(G.Vertices) loop
            Result(J) := G.Vertices.Element(I);
            J := J + 1;
        end loop;
        
        return Result;
    end To_Vertex_Array;
    
end Graph;