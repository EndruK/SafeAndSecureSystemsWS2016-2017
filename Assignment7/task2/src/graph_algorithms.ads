-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Graph;
with Ada.Containers.Vectors;

generic
    type Vertex_Type is private;
    with function "="(Left: Vertex_Type; Right: Vertex_Type) return Boolean;
    with procedure Put_Vertex(V : Vertex_Type);
    with package Graph_Instance is new Graph(Vertex_Type, "=", Put_Vertex);
package Graph_Algorithms is
    use Graph_Instance;
    use Edge_Vectors;
    use Vertex_Vectors;

    package Graph_Vectors is new Ada.Containers.Vectors(
        Element_Type => Graph_Type,
        Index_Type   => Natural);
    use Graph_Vectors;
    -- Implements Dijkstra's shortest-path algorithm in the given graph with
    -- edge weights. Raises an exception if there is no path connecting From
    -- and To. Raises an exception if From and/or To is not in G.
    function Find_Shortest_Path(G: Graph_Type;
                                From: Vertex_Type;
                                To: Vertex_Type) return Integer;

    -- Implements a minimal-spanning-tree (MST) algorithm in the given graph
    -- with edge weights. If G is connected, returns a new graph with all
    -- vertices of G and only those edges that form the MST.
    -- Raises an exception otherwise.
    function Find_Min_Spanning_Tree(G: Graph_Type) return Graph_Type;


    function Graph_Contains_Vertex(G: Graph_Type; V: Vertex_Type) return Boolean;
    procedure Merge_Graphs(From_Graph : in out Graph_Type; To_Graph : in Graph_Type);
    function Equals(Left : in Graph_Type; Right : in Graph_Type) return Boolean;
    procedure Print_Edges(G: Graph_Type);
end Graph_Algorithms;
