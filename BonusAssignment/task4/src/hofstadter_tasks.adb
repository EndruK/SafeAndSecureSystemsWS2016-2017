with Ada.Integer_Text_IO, Ada.Text_IO, Hofstadter, Ada.Calendar;
use Ada.Integer_Text_IO, Ada.Calendar;

package body Hofstadter_Tasks is
    package Hofstadter_Package is new Hofstadter (Num_Tasks => 1);
    package HP renames Hofstadter_Package;

    Timer : Timer_Type;
    Master : Master_Type;
    Worker : Worker_Type;
    TTL : Duration;
    Target_Value : Positive;
    Calculation_Finished : Boolean := False;
    Result : Positive;

--------------------------------------------------------------------------------
-- Task Bodies
--------------------------------------------------------------------------------
    task body Timer_Type is
        Kill_Time : Time;
    begin
        select
            accept Start do
                Kill_Time := TTL + Clock;
            end Start;
        or
            terminate;
        end select;
        loop
            if (clock > Kill_Time) then
                Ada.Text_IO.Put_Line("Kill_Time: Time to kill.");
                Master.Shutdown;
                exit;
            elsif (Calculation_Finished) then
                exit;
            end if;
        end loop;
end Timer_Type;

    task body Master_Type is
    begin
        loop
            select
                accept Start;
                Ada.Text_IO.Put_Line("Start calculations.");
                Worker.Master_Start;
            or
                accept Shutdown do
                    Ada.Text_IO.Put_Line("Master: stopping.");
                end Shutdown;
                Worker.Stop;
                -- abort Worker;
                exit;
            or
                terminate;
            end select;
        end loop;
    end Master_Type;

    task body Worker_Type is
    begin
        loop
            select
                accept Master_Start;
                Result := HP.Compute_Q_Sequence_Sequential(Target_Value);
                Calculation_Finished := True;
                -- Worker.Show_Result;
            or
                accept Stop do
                    Ada.Text_IO.Put_Line("Worker: stopping.");
                end Stop;
                exit;
            -- or
                -- accept Show_Result;
                -- Put(Result);
            or
                terminate;
            end select;
        end loop;
    end Worker_Type;

--------------------------------------------------------------------------------
-- Procedures
--------------------------------------------------------------------------------
    procedure Init is
    begin
        select
            Master.Start;
            Timer.Start;
        or
            delay 5.0;
        end select;
    end Init;

    procedure Set_TTL(T : in Duration) is
    begin
        TTL := T;
    end Set_TTL;

    procedure Set_Target_Value(N : in Positive) is
    begin
        Target_Value := N;
    end Set_Target_Value;
end Hofstadter_Tasks;
