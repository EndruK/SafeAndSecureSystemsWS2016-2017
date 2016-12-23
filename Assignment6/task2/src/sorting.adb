-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

pragma SPARK_Mode(on);
package body Sorting is
    procedure Selection_Sort(A: in out Natural_Array) is
        temp : Natural;
        iMin : Natural;
    begin -- Selection_Sort
        for j in 1 .. A'Last - 1 loop --First .. A'Length - 1 loop
            --pragma Loop_Variant(Decreases => (A'Length - 1) - j);
            iMin := j;
            pragma Loop_Invariant(iMin in A'Range);
            for i in j + 1 .. A'Last loop
                --pragma Loop_Variant(Decreases => A'Last - i);
                if A(i) < A(iMin) then
                    iMin := i;
                end if;
            end loop;
            if iMin /= j then
                temp := A(j);
                A(j) := A(iMin);
                A(iMin) := temp;
            end if;
            --pragma Loop_Invariant(for all x in A'First .. j => A(x) <= A(j));
        end loop;
    end Selection_Sort;
end Sorting;
