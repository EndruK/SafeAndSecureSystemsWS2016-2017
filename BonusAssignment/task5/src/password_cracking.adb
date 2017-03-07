-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;
package body Password_Cracking is
    procedure Find_Passwords(Hashes:    Hash_Array_Type;
                             Passwords: out Password_Array_Type;
                             Success:   out Boolean) is
        C_Main : Collector;
--------------------------------------------------------------------------------
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
            Interrupt_Flag : Boolean := False;
        begin
            accept Start_Cracking(Hash : in Hash_Type) do
                Final_Hash := Hash;
            end Start_Cracking;
            First(Password);
            Minion_Loop:
            loop
                if C_Main.Get_User_Interrupt or C_Main.Get_Timeout_Interrupt then
                    exit Minion_Loop;
                end if;
                if Compute_Hash(Password) = Final_Hash then
                    Final_Password := Password;
                    Success := True;
                    Put_Line(Password);
                    exit Minion_Loop;
                elsif not Has_Next(Password) then
                    Final_Password := "";
                    exit Minion_Loop;
                else
                    Next(Password);
                end if;
            end loop Minion_Loop;
            accept Report_Result(Password : out Password_Type;
                    PW_Found : out Boolean) do
                Password := Final_Password;
                PW_Found := Success;
            end Report_Result;
        end Hash_Minion;
        type Minion_Pool_Type is array(Positive Range 1..Num_Tasks) of Hash_Minion;
        Minion_Pool : Minion_Pool_Type;
--------------------------------------------------------------------------------
        task type User_Input_Task;
        task body User_Input_Task is
            S : String := " ";
            Last : Integer;
        begin
            loop
                if C_Main.Get_Timeout_Interrupt then
                    exit;
                end if;
                Get_Line(S,Last); --blocking state
                if(S = "q") then
                    C_Main.Set_User_Interrupt;
                    Put_Line("User Abort");
                    exit;
                end if;
            end loop;
        end User_Input_Task;
--------------------------------------------------------------------------------
        task type Timeout_Task is
            entry Start(T : Positive);
        end Timeout_Task;
        task body Timeout_Task is
            End_Time : Time;
            D : Duration;
        begin
            accept Start(T : Positive) do
                D := Duration(T);
            end Start;
            End_Time := Clock + D;
            loop
                if(Clock >= End_Time) then
                    Put_Line("time over");
                    C_Main.Set_Timeout_Interrupt;
                    exit;
                end if;
                if(C_Main.Get_User_Interrupt) then
                    exit;
                end if;
            end loop;
        end Timeout_Task;
--------------------------------------------------------------------------------
    begin
        declare
            Hash_Index : Positive := 1;
            tmp2 : Boolean;
            User_Input_Minnion : User_Input_Task; -- spawn user input task
            Timeout_Minion : Timeout_Task; -- spawn timeout task
        begin
            -- Start Tasks
            for Task_Index in Minion_Pool_Type'Range loop
                Minion_Pool(Task_Index).Start_Cracking(Hashes(Hash_Index));
                Hash_Index := Hash_Index + 1;
            end loop;
            Timeout_Minion.Start(Max_Time);

            Hash_Index := 1;
            -- Get Task Results
            for Task_Index in Minion_Pool_Type'Range loop
                Minion_Pool(Task_Index).Report_Result(Passwords(Hash_Index),tmp2);
                Hash_Index := Hash_Index + 1;
            end loop;
            -- Print Results
            Success := True;
            for I in Passwords'Range loop
                if Passwords(I) = "" then
                    Success := False;
                    exit;
                end if;
            end loop;
        end;
    end Find_Passwords;
--------------------------------------------------------------------------------
    protected body Collector is

        procedure Set_User_Interrupt is
        begin
            User_Interrupt := True;
        end Set_User_Interrupt;

        procedure Set_Timeout_Interrupt is
        begin
            Timeout_Interrupt := True;
        end Set_Timeout_Interrupt;

        function Get_User_Interrupt return Boolean is
        begin
            return User_Interrupt;
        end Get_User_Interrupt;

        function Get_Timeout_Interrupt return Boolean is
        begin
            return Timeout_Interrupt;
        end Get_Timeout_Interrupt;

    end Collector;

end Password_Cracking;
