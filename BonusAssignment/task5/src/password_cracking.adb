with Ada.Text_IO; use Ada.Text_IO;
package body Password_Cracking is
    procedure Find_Passwords(Hashes:    Hash_Array_Type;
                             Passwords: out Password_Array_Type;
                             Success:   out Boolean) is
    begin
        for H in Hashes'Range loop
            Put_Line(Hashes(H));
        end loop;
    end Find_Passwords;
end Password_Cracking;
