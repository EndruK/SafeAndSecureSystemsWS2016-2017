with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Password_Cracking is
    procedure Find_Passwords(Hashes:    Hash_Array_Type;
                             Passwords: out Password_Array_Type;
                             Success:   out Boolean) is
        task type Hash_Minion is
            entry Start_Cracking(Hash : in Hash_Type);
            entry Interrupt;
            entry Report_Result(Password : out Password_Type; PW_Found : out Boolean);
        end Hash_Minion;
        task body Hash_Minion is
            Password : Password_Type;
            Final_Hash : Hash_Type;
            Final_Password : Password_Type;
            Success : Boolean := False;
            -- tmp : Natural := 1;
            Interrupt_Flag : Boolean := False;
        begin
            accept Start_Cracking(Hash : in Hash_Type) do
                Final_Hash := Hash;
            end Start_Cracking;
            First(Password);
            Minion_Loop:
            loop
                exit Minion_Loop when Interrupt_Flag;
                select
                    accept Interrupt do
                        -- wenn nutzer q drückt exit loop
                        Interrupt_Flag := True;
                    end Interrupt;
                else
                    -- tmp := tmp + 1;
                    -- Put(tmp);
                    -- Put_Line("");
                    -- otherwise do things
                    if Compute_Hash(Password) = Final_Hash then
                        -- juhuu passwort gefunden
                        Final_Password := Password;
                        Success := True;
                        exit Minion_Loop;
                    elsif not Has_Next(Password) then
                        -- letztes passwort abgegrast
                        Final_Password := "";
                        exit Minion_Loop;
                    else
                        Next(Password);
                    end if;
                end select;
            end loop Minion_Loop;
            accept Report_Result(Password : out Password_Type; PW_Found : out Boolean) do
                Password := Final_Password;
                PW_Found := Success;
            end Report_Result;
        end Hash_Minion;
        type Minion_Pool_Type is array(Positive Range 1..Num_Tasks) of Hash_Minion;
        Minion_Pool : Minion_Pool_Type;
    begin
        -- here all tasks have to be created and they have to check Success / q-press / time
        -- for Minion in Minion_Pool'Range loop
        --     Minion_Pool(Minion).Start_Cracking();
        -- end loop;
        declare
            Hash_Index : Positive := 1;
            tmp2 : Boolean;
        begin
            for Task_Index in Minion_Pool_Type'Range loop
                Minion_Pool(Task_Index).Start_Cracking(Hashes(Hash_Index));
                Hash_Index := Hash_Index + 1;
            end loop;
            Hash_Index := 1;
            for Task_Index in Minion_Pool_Type'Range loop
                Minion_Pool(Task_Index).Report_Result(Passwords(Hash_Index),tmp2);
                Hash_Index := Hash_Index + 1;
            end loop;
            -- Minion_Pool(1).Report_Result(tmp,tmp2);
            -- Put_Line(tmp);
            for Password in Passwords'Range loop
                Put_Line(Passwords(Password));
            end loop;
        end;
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
end Password_Cracking;
