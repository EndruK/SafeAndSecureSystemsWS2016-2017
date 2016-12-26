-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

-- pragma SPARK_Mode(on);
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Helper is
    procedure Swap(A: in out Natural_Array, Old_Min, New_Min in Natural) is
        temp : Natural;
    begin -- Swap
        temp := A(Old_Min);
        A(Old_Min) := A(New_Min);
        A(New_Min) := temp;
        for i in A loop
            Ada.Text_IO.Put_Line("");
            Ada.Integer_Text_IO.Put(A(i));
        end loop;
        Ada.Text_IO.Put_Line("###########");
    end Swap;
end Helper;
