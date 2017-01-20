with Graph;

generic
    type Vertex_Type is private;
    with function "="(Left: Vertex_Type; Right: Vertex_Type) return Boolean;
    with package Graph_Instance is new Graph(Vertex_Type, "=");
package Graph_Algorithms is
    use Graph_Instance;
    
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
end Graph_Algorithms;