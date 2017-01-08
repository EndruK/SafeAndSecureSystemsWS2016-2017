-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
pragma SPARK_Mode(on);

package Sorting is

    type Natural_Array is array(Natural range <>) of Natural;

    procedure Selection_Sort(A: in out Natural_Array) with
        Pre =>  A'Length > 1 and
                A'Length < Integer'Last - 1,
        Post => Is_Sorted(A) and A'Length = A'Old'Length;
    --    Post => (for all x in A'Old'Range => (
    --                if x <= A'Old'Last - 1 then A(x) <= A(x+1)
    --            ));

    -- helper functions
    function Is_Sorted(A: in Natural_Array) return Boolean with
        Pre =>  A'Length > 1 and
                A'Length < Integer'Last - 1;
end Sorting;
