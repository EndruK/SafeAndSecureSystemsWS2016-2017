-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

pragma SPARK_Mode(on);
package body Sorting is
    procedure Selection_Sort(A: in out Natural_Array) is
        temp : Natural;
        iMin : Natural;
    begin -- Selection_Sort
        -- outer loop, iterates over all elements from First to (Last_Element - 1)
        -- Assume that after each sort the next selected 'j' is the minimum
        -- In the first iteration although
        for j in A'First .. A'Last - 1 loop --First .. A'Length - 1 loop
            iMin := j;
            pragma Loop_Invariant(
                (j in A'Range) and (j <= A'Last - 1)
                and (A'Length > 1) and (A'Length <= Integer'Last)
                and (iMin in A'Range)
            );
            -- pragma Loop_Variant(Decreases => (A'Length - 1) - j);
            -- pragma Loop_Invariant((iMin in A'Range) and (for all x in A'First .. j => A(x) <= A(j)));
            -- Iterate over all elements in A from 'j+1' until A'Last and find smallest value of them
            -- iMin holds index of smallest found value
            -- After iterating over all elements swap values of A(j) with A(iMin)
            for i in j + 1 .. A'Last loop
                pragma Loop_Invariant(
                    (i in A'Range) and (j+1 in A'Range)
                );
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
