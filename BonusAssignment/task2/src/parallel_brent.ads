with Brent_Context;

generic
    with package Context is new Brent_Context(<>);
package Parallel_Brent is
    use Context;
    procedure Search_Collision(First: out Point_Type; Second: out Point_Type);
end Parallel_Brent;