-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

-- pragma SPARK_Mode(on);
with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
package body Sorting is
    procedure Selection_Sort(A: in out Natural_Array) is
        j : Natural := 0;
        i, temp : Natural;
        iMin : Natural;
        A_Length : Natural := A'Length;
    begin -- Selection_Sort
        for j in A'First .. A'Length-1 loop

            iMin := j;
            i := j + 1;
            -- Ada.Text_IO.Put_Line("Print j ");
            -- Ada.Integer_Text_IO.Put(j);
            -- Ada.Text_IO.Put_Line(" ");
            for i in j+1 .. A'Last loop --A'Range loop
                if A(i) < A(iMin) then
                    iMin := i;
                end if;
            end loop;
            if iMin /= j then
                temp := A(j);
                A(j) := A(iMin);
                A(iMin) := temp;

                -- Ada.Text_IO.Put_Line(" ");
                -- Ada.Integer_Text_IO.Put(A(iMin));
            end if;
        end loop;
        -- debug start
        -- temp := A'First;
        -- Ada.Text_IO.Put_Line(" ");
        -- Ada.Text_IO.Put_Line("Print array A: ");
        -- for temp in A'Range loop
        --     Ada.Text_IO.Put_Line(" ");
        --     Ada.Integer_Text_IO.Put(A(temp));
        -- end loop;
        -- Ada.Text_IO.Put_Line(" ");
        -- debug end
    end Selection_Sort;
end Sorting;
