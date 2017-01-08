with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Parallel_Algorithms is
    procedure Parallel_Sum(Input: Array_Access_Type;
                           Result: out Item_Type;
                           Tasks : in Integer) is
--------------------------------------------------------------------------------
        task type Partial_Sum is
            entry Calc_Sum(Item_Array     : in Array_Access_Type;
                           Start_Position : in Integer;
                           End_Position   : in Integer);
            entry Result(Num : out Item_Type);
        end Partial_Sum;
--------------------------------------------------------------------------------
        task body Partial_Sum is
            Intermediate : Item_Type;
            Current_Item : Array_Access_Type;
        begin
            accept Calc_Sum(Item_Array     : in Array_Access_Type;
                            Start_Position : in Integer;
                            End_Position   : in Integer) do
                for I in Start_Position..End_Position loop
                    Intermediate := Intermediate + Item_Array(I);
                end loop;
            end Calc_Sum;

            accept Result(Num : out Item_Type) do
                Num := Intermediate;
            end Result;
        end Partial_Sum;
--------------------------------------------------------------------------------
        type Task_Pool is array(Positive Range 1..Tasks) of Partial_Sum;
        -- Task_A, Task_B : Partial_Sum;
        My_Pool : Task_Pool;
        Full, Rest : Integer;
        Elements : array(Positive Range 1..Tasks) of Integer;
--------------------------------------------------------------------------------
    begin -- Parallel_Sum
        Full := Integer(Float'Floor(Float(Input'Length) / Float(Tasks)));
        Rest := Input'Length mod Tasks;
        for c in 1..Tasks loop
            if Rest > 0 then
                Elements(c) := Full + 1;
                Rest := Rest - 1;
            else
                Elements(C) := Full;
            end if;
        end loop;
        declare
            Position : Integer := 1;
        begin
            for c in 1..Tasks loop
                My_Pool(c).Calc_Sum(Input, Position, Position + Elements(c)-1);
                Position := Position + Elements(c);
            end loop;
        end;
        for c in My_Pool'Range loop
            declare
                Temp : Item_Type;
            begin
                My_Pool(c).Result(Temp);
                Result := Result + Temp;
            end;
        end loop;
    end Parallel_Sum;
--------------------------------------------------------------------------------
end Parallel_Algorithms;
