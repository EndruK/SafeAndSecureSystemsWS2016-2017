with Ada.Integer_Text_IO, Ada.Text_IO, Hofstadter, Ada.Calendar;
use Ada.Integer_Text_IO, Ada.Calendar;

package body Hofstadter_Tasks is
    package Hofstadter_Package is new Hofstadter (Num_Tasks => 1);
    package HP renames Hofstadter_Package;

    Pressed_Key : Character;
    Key_Triggered : Boolean;

    Worker_List : Worker_Array_Type(1 .. N_Tasks);
    Result : Result_Protected_Type;
    Counter : Positive := 2;

    Timer : Timer_Type;
    Master : Master_Type;
    Worker : Worker_Type;
    TTL : Duration;
    -- Target_Value : Positive;
    Calculation_Finished : Boolean := False;
    -- Result : Positive;

--------------------------------------------------------------------------------
-- Protected Objects
--------------------------------------------------------------------------------
protected body Result_Protected_Type is
    function Get_Result (At_Index : in Positive) return Positive is
        begin
            return Data(At_Index);
        end Get_Result;
    procedure Set_Result (At_Index : in Positive; Result_Value : in Positive) is
        begin
            Data(At_Index) := Result_Value;
            if At_Index = Target_Value then
                Calculation_Finished := True;
            end if;
        end Set_Result;
    end Result_Protected_Type;

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
            Ada.Text_IO.Get_Immediate(Pressed_Key, Key_Triggered);
            if (clock > Kill_Time) then
                Ada.Text_IO.Put_Line("Kill_Time: Time to kill.");
                Master.Shutdown;
                exit;
            elsif (Pressed_Key = 'q' and Key_Triggered) then
                Ada.Text_IO.Put_Line("User interrupt: Quit.");
                Master.Shutdown;
                exit;
            elsif (Calculation_Finished) then
                Master.Show_Result;
                exit;
            end if;
        end loop;
    end Timer_Type;

    task body Master_Type is
    begin
        select
            accept Start;
            for I in Worker_List'Range loop
                Counter := Counter + 1;
                Worker_List(I).Start(Counter);
                Ada.Text_IO.Put_Line(Integer'Image(I));
            end loop;
            Ada.Text_IO.Put_Line("Start calculations.");
            --Worker.Start;
        end select;
        loop
            select
                accept Shutdown do
                    for I in Worker_List'Range loop
                        Worker_List(I).Stop;
                        Ada.Text_IO.Put_Line("Stopping Worker Number: " & Integer'Image(I));
                    end loop;
                    Ada.Text_IO.Put_Line("Master: stopping.");
                end Shutdown;
                exit;
            or
                accept Worker_Needs_Work do
                    Counter := Counter + 1;
                    --Task_Id.Start(Counter);
                end Worker_Needs_Work;
            or
                accept Show_Result do
                    for I in Worker_List'Range loop
                        Worker_List(I).Stop;
                        -- Ada.Text_IO.Put_Line("Stopping Worker Number: " & Integer'Image(I));
                    end loop;
                    Ada.Text_IO.Put_Line("Target_Value: " & Integer'Image(Target_Value));
                    Ada.Text_IO.Put_Line("Counter: " & Integer'Image(Counter));
                    Ada.Text_IO.Put_Line("Result: " & Integer'Image(Result.Get_Result(Counter)));
                end Show_Result;
                exit;
            or
                terminate;
            end select;
        end loop;
    end Master_Type;

    task body Worker_Type is
        Calc_Value : Positive;
    begin
        loop
            select
                accept Start(Given_Value : in Positive) do
                    Calc_Value := Given_Value;
                end Start;
                -- Compute_Q_Sequence_Sequential(Calc_Value);
                Result.Set_Result(Calc_Value,
                                  Compute_Q_Sequence_Sequential(Calc_Value));
                -- Calculation_Finished := True;
                Master.Worker_Needs_Work;
            or
                accept Stop do
                    Ada.Text_IO.Put_Line("Worker: stopping.");
                end Stop;
                exit;
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
        Result.Set_Result(1, 1);
        Result.Set_Result(2, 1);
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

--    procedure Set_Target_Value(N : in Positive) is
--    begin
--        Target_Value := N;
--    end Set_Target_Value;

--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------
    function Compute_Q_Sequence_Sequential(N: Positive) return Positive is
        Computed_Q : Positive;
    begin
        for I in Positive range 3..N loop
            Computed_Q := (
                I - Result.Get_Result(I-1)) +
                Result.Get_Result(I - Result.Get_Result(I-2));
        end loop;
        return Computed_Q;
    end Compute_Q_Sequence_Sequential;
end Hofstadter_Tasks;
