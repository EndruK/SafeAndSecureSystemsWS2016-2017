-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
generic
    type Item_Type is private;
    with function "<"(Left: Item_Type; Right: Item_Type) return Boolean is <>;
    with procedure Put_Item(Item: Item_Type);
package Parallel_Algorithms is

    type Array_Type is array(Natural range <>) of Item_Type;
    type Array_Access_Type is access all Array_Type;

    procedure Parallel_Merge_Sort(Input: Array_Access_Type;
                                  Result: out Array_Access_Type);
    function Merge_Sort(A : Array_Access_Type) return Array_Access_Type;
    function Merge(Left  : in Array_Access_Type;
                   Right : in Array_Access_Type) return Array_Access_Type;
    procedure Print_Array(A : Array_Access_Type);

end Parallel_Algorithms;
