with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Password_Cracking is
    procedure Find_Passwords(Hashes:    Hash_Array_Type;
                             Passwords: out Password_Array_Type;
                             Success:   out Boolean) is
    begin
        -- here all tasks have to be created and they have to check Success / q-press / time
        for I in 1..Num_Tasks loop
            declare
                Minion : Hash_Minion;
            begin
                Null;
            end;
        end loop;
        -- for H in Hashes'Range loop
        --     Put_Line(Hashes(H));
        -- end loop;
        -- declare
        --     Temp : Password_Type;
        -- begin
        --     First(Temp);
        --     for I in 1..3800 loop
        --         Put_Line(Temp);
        --         Next(Temp);
        --     end loop;
        -- end;
    end Find_Passwords;
--------------------------------------------------------------------------------
    task body Hash_Minion is
    begin
        null;
    end Hash_Minion;
end Password_Cracking;
