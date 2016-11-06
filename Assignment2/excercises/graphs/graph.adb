with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Graph is
    -- DEBUG pragma Assertion_Policy(Check);
    -- Stores the Vertex in the Graph. Raises a
    -- Vertex_Already_In_Graph_Exception if it is already in the graph.
    procedure Add_Vertex(Vertex: Vertex_Type) is
    begin
        Put("Add_Vertex");
    end Add_Vertex;

    -- Stores a new edge in the Graph from From to To that has the given
    -- Weight assigned to it. If an edge from From to To is already stored
    -- in the Graph, this function only re-assigns the given Weight to it
    -- and does nothing beyond.
    procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer) is
    begin
        Put("Add_Edge");
    end Add_Edge;

    -- Removes all vertices and edges from the graph.
    procedure Clear is
    begin
        Put("Clear");
    end Clear;

    -- Returns the weight of the edge, if it is stored in the graph.
    -- Raises an Edge_Not_Found_Exception otherwise.
    function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer is
    begin
        Put("Get_Edge_Weight");
        return 1;
    end Get_Edge_Weight;

    -- Returns True if an edge from From to To is stored in the graph.
    -- Returns False otherwise.
    function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
    begin
        Put("Has_Edge");
        return True;
    end Has_Edge;

    -- Removes the edge in the Graph from From to To, if existing;
    -- Raises an Edge_Not_Found_Exception otherwise.
    function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
    begin
        Put("Remove_Edge");
        return True;
    end Remove_Edge;

    -- Returns an array containing exactly all current vertices of the graph.
    function To_Vertex_Array return Vertex_Array is
        foobar : Vertex_Array(1 .. 2);
    begin
        Put("To_Vertex_Array");
        return foobar;
    end To_Vertex_Array;
end Graph;
