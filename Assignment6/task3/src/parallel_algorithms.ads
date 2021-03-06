-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
generic
    type Item_Type is private;
    with function "+"(Left: Item_Type; Right: Item_Type) return Item_Type;
package Parallel_Algorithms is
    -- array of dynamic range of generic type
    type Array_Type is array(Natural range <>) of Item_Type;
    -- pointer of array type
    type Array_Access_Type is access all Array_Type;

    -- procedure to calculate the sum of an array
    -- by giving the pointer to the array and a result object
    procedure Parallel_Sum(Input : Array_Access_Type;
                           Result : out Item_Type;
                           Tasks : in Integer);

end Parallel_Algorithms;
