with Collision_Search_Context;

generic
    with package Context is new Collision_Search_Context(<>);
package Parallel_Collision_Search is
    -- Outputs two distinguished points that lead to a partial collision.
    procedure Search_Collisions(First:  out Distinguished_Point_Type; 
                                Second: out Distinguished_Point_Type);
end Parallel_Collision_Search;