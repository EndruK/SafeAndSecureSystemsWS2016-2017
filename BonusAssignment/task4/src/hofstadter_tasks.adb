with Ada.Integer_Text_IO, Ada.Text_IO, Hofstadter, Ada.Calendar;
use Ada.Integer_Text_IO, Ada.Calendar;

package body Hofstadter_Tasks is
    package Hofstadter_Package is new Hofstadter (Num_Tasks => 1);
    package HP renames Hofstadter_Package;

    type task Master_Type is
        entry Start;
        entry Shutdown;
    end Master_Type;

    type task Worker_Type is
        entry Master_Start;
    end Worker_Type;

    type task Timer_Type is
        entry Start;
    end Timer_Type;

    Timer : Timer_Type;
    Master : Master_Type;
    Worker : Worker_Type;
    TTL : Duration;
    Target_Value : Positive;

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
                abort Master;
            end if;
        end loop;
    end Timer_Type;

    task body Master_Type is
    begin
        loop
            select
                accept Start;
                Ada.Text_IO.Put_Line("Start HP_Task");
                select
                    Worker.Master_Start;
                or
                    delay 5.0;
                end select;
            or
                accept Shutdown;
                exit;
            or
                terminate;
            end select;
        end loop;
    end Master_Type;

    task body Worker_Type is
    begin
        select
            accept Master_Start;
        end select;
        delay 3.0;
        Put(HP.Compute_Q_Sequence_Sequential(Target_Value));
    end Worker_Type;

--------------------------------------------------------------------------------
-- Setter
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
