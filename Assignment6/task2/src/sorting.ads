-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

package Sorting is
    pragma SPARK_Mode(on);

    type Natural_Array is array(Natural range <>) of Natural;

    procedure Selection_Sort(A: in out Natural_Array) with
        Pre =>  A'Length > 1 and
                A'Length < Integer'Last - 1,
        Post => A'Length = A'Old'Length;

    -- helper functions
    function Is_Sorted(Unsorted_A: in Natural_Array) return Boolean with
        Pre =>  Unsorted_A'Length > 1 and
                Unsorted_A'Length < Integer'Last - 1;
end Sorting;
