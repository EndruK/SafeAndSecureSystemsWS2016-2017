with Ada.Containers;

use Ada.Containers;

package body Graph is

    function "="(Left: Graph_Type; Right: Graph_Type) return Boolean is
        Vertex: Vertex_Type;
        Edge: Edge_Type;
    begin
        if Length(Left.Vertices) /= Length(Right.Vertices) or else
            Length(Left.Edges) /= Length(Right.Edges) then
            return False;
        end if;

        for I in First_Index(Left.Vertices) .. Last_Index(Left.Vertices) loop
            Vertex := Left.Vertices.Element(I);

            if not Right.Vertices.Contains(Vertex) then
                return False;
            end if;
        end loop;

        for I in First_Index(Left.Edges) .. Last_Index(Left.Edges) loop
            Edge := Left.Edges.Element(I);

            if not Right.Edges.Contains(Edge) then
                return False;
            end if;
        end loop;

        return True;
    end "=";

    -- ---------------------------------------------------------------

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

--------------------------------------------------------------------------------

    procedure Add_Edge(G: in out Graph_Type; Edge: Edge_Type) is
    begin
        Add_Edge(G, Edge.From, Edge.To, Edge.Weight);
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

--------------------------------------------------------------------------------

    function Has_Vertex(G: Graph_Type; Vertex : Vertex_Type) return Boolean is
        V : Vertex_Type;
    begin
        for I in First_Index(G.Vertices)..Last_Index(G.Vertices) loop
            V := G.Vertices.Element(I);
            if Vertex = V then
                return True;
            end if;
        end loop;
        return False;
    end Has_Vertex;

    -- ---------------------------------------------------------------

    function Remove_Edge(G: in out Graph_Type;
                         From: Vertex_Type;
                         To: Vertex_Type) return Boolean is
        Edge: Edge_Type;
    begin
        for I in First_Index(G.Edges) .. Last_Index(G.Edges) loop
            Edge := G.Edges.Element(I);

            if Edge.From = From and Edge.To = To then
                G.Edges.Delete(I);
                return True;
            end if;
        end loop;

        raise Edge_Not_Found_Exception;
    end Remove_Edge;

--------------------------------------------------------------------------------

    function Remove_Edge(G: in out Graph_Type;
                         Edge : Edge_Type) return Boolean is
    begin
        return Remove_Edge(G, Edge.From, Edge.To);
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
