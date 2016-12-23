-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

package Sorting is
    type Natural_Array is array(Natural range <>) of Natural;

    procedure Selection_Sort(A: in out Natural_Array);
end Sorting;
