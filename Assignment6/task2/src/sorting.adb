-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

-- pragma SPARK_Mode(on);
package body Sorting is
    procedure Selection_Sort(A: in out Natural_Array) is
        j : Natural := 0;
        i : Natural;
        iMin : Natural;
        A_Length : Natural := A'Length;
    begin -- Selection_Sort
        for j in A_Length - 1 loop;
            iMin := j;
            i := j + 1;
            for i in A_Length loop;
                if A[i] < A[iMin] then
                    iMin := i;
                end if;
            end loop;
        end loop;
    end Selection_Sort;
end Sorting;
