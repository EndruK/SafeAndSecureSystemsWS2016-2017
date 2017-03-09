-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Integer_Text_IO, Ada.Text_IO, Ada.Calendar;
use Ada.Integer_Text_IO, Ada.Calendar;

package body Hofstadter_Tasks is
    Pressed_Key : Character;
    Key_Triggered : Boolean;
    TTL : Duration;
    Counter : Natural := 0;
    Calculation_Finished : Boolean := False;
    Result : Result_Array(1 .. N_Tasks);

    Timer : Timer_Type;
    Master : Master_Type;
    Worker : Worker_Type;

    Worker_List : Worker_Array_Type(1 .. N_Tasks);
    Worker_Index : Natural := 1;
    Worker_Shutdown : Boolean := False;
    Worker_Status : Status_Array(1 .. N_Tasks);

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
                Worker_Shutdown := True;
                Master.Show_Result;
                -- Master.Shutdown;
                exit;
            elsif (Pressed_Key = 'q' and Key_Triggered) then
                Ada.Text_IO.Put_Line("User interrupt: Quit.");
                Worker_Shutdown := True;
                Master.Shutdown;
                exit;
            elsif (Calculation_Finished) then
                Master.Show_Result;
                exit;
            end if;
            Status_Loop :
            for I in Worker_Status'Range loop
                Calculation_Finished := False;
                exit Status_Loop when Worker_Status(I) = False;
                Calculation_Finished := True;
            end loop Status_Loop;
        end loop;
    end Timer_Type;

    task body Master_Type is
        tmp_myArray : myArray;
    begin
        select
            accept Start;
            for I in Worker_List'Range loop
                Worker_List(I).Start(Target_Value - Counter, Worker_Index);
                Ada.Text_IO.Put_Line("Target_Value: " & Integer'Image(Target_Value - Counter));
                Ada.Text_IO.Put_Line("Worker_Index: " & Integer'Image(Worker_Index));
                Counter := Counter + 1;
                Worker_Index := Worker_Index + 1;
            end loop;
            Ada.Text_IO.Put_Line("Start calculations.");
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
                accept Show_Result do
                    for I in Worker_List'Range loop
                        Worker_List(I).Stop;
                    end loop;
                    Ada.Text_IO.Put_Line("Target_Value: " & Integer'Image(Target_Value));
                    Ada.Text_IO.Put_Line("Number of Tasks: " & Integer'Image(Counter));
                    for I in Result'Range loop
                        tmp_myArray := Result(I);
                        if Worker_Shutdown then
                            Ada.Text_IO.Put_Line("Calculated Results of Task" & Integer'Image(I) & ": ");
                        else
                            Ada.Text_IO.Put_Line("Result of Q(" & Integer'Image(Target_Value - I + 1) & "): ");
                        end if;
                        for J in tmp_myArray'Range loop
                            if tmp_myArray(J) /= 0 then
                                if J /= 1 then
                                    Ada.Text_IO.Put(", " & Integer'Image(tmp_myArray(J)));
                                else
                                    Ada.Text_IO.Put(Integer'Image(tmp_myArray(J)));
                                end if;
                            end if;
                        end loop;
                        Ada.Text_IO.New_Line;
                    end loop;
                end Show_Result;
                exit;
            or
                terminate;
            end select;
        end loop;
    end Master_Type;

    task body Worker_Type is
        Calc_Value : Positive;
        My_Id : Positive;
        My_QArray : myArray;
    begin
        loop
            select
                accept Start(Given_Value : in Positive;
                             Worker_Id : in Positive) do
                    Calc_Value := Given_Value;
                    My_Id := Worker_Id;
                end Start;
                My_QArray := Compute_Q_Sequence_Sequential(Calc_Value);
                Result(My_Id) := My_QArray;
                Worker_Status(My_Id) := True;
            or
                accept Stop do
                    Ada.Text_IO.Put_Line("Worker " & Integer'Image(My_Id) & ": stopping.");
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
        -- Result.Set_Result(1, 1);
        -- Result.Set_Result(2, 1);
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

--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------
    function Compute_Q_Sequence_Sequential(N: Positive) return myArray is
        Q_Numbers: myArray := new QArray(1..N);
    begin
        Q_Numbers(1) := 1;
        Q_Numbers(2) := 1;

        for I in Positive range 3..N loop
            if not Worker_Shutdown then
                Q_Numbers(I) := Q_Numbers(I - Q_Numbers(I-1))+
                                Q_Numbers(I - Q_Numbers(I-2));
            else
                exit;
            end if;
        end loop;
        return Q_Numbers;
    end Compute_Q_Sequence_Sequential;
end Hofstadter_Tasks;
