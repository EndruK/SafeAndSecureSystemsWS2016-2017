-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

pragma SPARK_Mode(on);
package body Sorting is
    procedure Selection_Sort(A: in out Natural_Array) is
        Temp : Natural;
        I_Min : Natural;
    begin -- Selection_Sort
        -- outer loop, iterates over all elements from First to (Last_Element - 1)
        -- Assume that after each sort the next selected 'J' is the minimum
        -- In the first iteration although
        for J in A'First .. A'Last - 1 loop
            I_Min := J;
            pragma Loop_Invariant(
                (J in A'Range) and (J <= A'Last - 1)
                and (A'Length > 1) and (A'Length <= Integer'Last)
                and (I_Min in A'Range)
            );
            -- Iterate over all elements in A from 'J+1' until A'Last and find smallest value of them
            -- I_Min holds index of smallest found value
            -- After iterating over all elements swap values of A(J) with A(I_Min)
            for I in J + 1 .. A'Last loop
                pragma Loop_Invariant(
                    (I in A'Range) and (J+1 in A'Range)
                    and (I_Min in A'Range)
                );
                if A(I) < A(I_Min) then
                    I_Min := I;
                end if;
            end loop;
            if I_Min /= J then -- swap values if they do not have the same index
                Temp := A(J);
                A(J) := A(I_Min);
                A(I_Min) := Temp;
            end if; -- end of swap
        end loop;
    end Selection_Sort;

    function Is_Sorted(Unsorted_A: in Natural_Array) return Boolean is
    begin --Is_Sorted
        for x in Unsorted_A'First .. Unsorted_A'Last - 1 loop
            if Unsorted_A(x) > Unsorted_A(x+1) then
                return False;
            end if;
        end loop;
        return True;
    end Is_Sorted;
end Sorting;
