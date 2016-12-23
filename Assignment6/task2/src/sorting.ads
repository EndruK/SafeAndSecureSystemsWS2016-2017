-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
pragma SPARK_Mode(on);
package Sorting is
    type Natural_Array is array(Natural range <>) of Natural;

    procedure Selection_Sort(A: in out Natural_Array) with
        Pre =>  A'Length > 1 and
                A'Length < Integer'Last - 1,
        Post => (for all i in 1 .. A'Last - 1 => A(i) <= A(i + 1));
end Sorting;
