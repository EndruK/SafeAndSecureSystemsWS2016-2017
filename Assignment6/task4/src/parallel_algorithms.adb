-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO; use Ada.Text_IO;
package body Parallel_Algorithms is
    function Merge(Left  : in Array_Access_Type;
                   Right : in Array_Access_Type)
                   return Array_Access_Type is
        Result : constant Array_Access_Type := new Array_Type(Left'First..Right'Last);
        L : Integer := Left'First;
        R : Integer := Right'First;
        RI : Integer := Result'First;
    begin
        while L <= Left'Last and R <= Right'Last loop
            if Left(L) < Right(R) then
                Result(RI) := Left(L);
                L := L + 1;
            else
                Result(RI) := Right(R);
                R := R + 1;
            end if;
            RI := RI + 1;
        end loop;
        if L <= Left'Last then
            Result(RI..Result'Last) := Left(L..Left'Last);
        end if;
        if R <= Right'Last then
            Result(RI..Result'Last) := Right(R..Right'Last);
        end if;
        return Result;
    end Merge;
--------------------------------------------------------------------------------
    function Merge_Sort(A : Array_Access_Type)
                        return Array_Access_Type is
        Result : Array_Access_Type := new Array_Type(A'Range);
        Pivot  : Integer;
    begin
        if A'Length < 2 then
            return A;
        else
            Pivot := (A'Length / 2) + A'First;
            declare
                L : Array_Access_Type := new Array_Type(A'First..(Pivot-1));
                R : Array_Access_Type := new Array_Type(Pivot..A'Last);
            begin
                for I in L'Range loop
                    L(I) := A(I);
                end loop;
                for I in R'Range loop
                    R(I) := A(I);
                end loop;
                L := Merge_Sort(L);
                R := Merge_Sort(R);
                Result := Merge(L, R);
            end;
            return Result;
        end if;
    end Merge_Sort;
--------------------------------------------------------------------------------
    procedure Print_Array(A : Array_Access_Type) is
    begin
        for I in A'Range loop
            Put_Item(A(I));
            Put(" ");
        end loop;
    end Print_Array;
--------------------------------------------------------------------------------
    procedure Parallel_Merge_Sort(Input: Array_Access_Type;
                                  Result: out Array_Access_Type) is
        task type Partial_Merge_Sort is
            entry Sort(Item_Array : in Array_Access_Type);
            entry Get_Result(Result : out Array_Access_Type);
        end Partial_Merge_Sort;
        task body Partial_Merge_Sort is
            Sorted_Part : Array_Access_Type;
        begin
            accept Sort(Item_Array : in Array_Access_Type) do
                Sorted_Part := Merge_Sort(Item_Array);
            end Sort;
            accept Get_Result(Result : out Array_Access_Type) do
                Result := Sorted_Part;
            end Get_Result;
        end Partial_Merge_Sort;
--------------------------------------------------------------------------------
    begin
        declare
            Pivot : constant Integer := Integer(Float'Floor(Float(Input'Length) / 2.0));
            Part_Array_A : Array_Access_Type := new Array_Type(Input'First..Pivot);
            Part_Array_B : Array_Access_Type := new Array_Type((Pivot+1)..Input'Last);
        begin
            for I in Part_Array_A'Range loop
                Part_Array_A(I) := Input(I);
            end loop;
            for I in Part_Array_B'Range loop
                Part_Array_B(I) := Input(I);
            end loop;
            declare
                Task_A, Task_B : Partial_Merge_Sort;
            begin
                Task_A.Sort(Part_Array_A);
                Task_B.Sort(Part_Array_B);
                Task_A.Get_Result(Part_Array_A);
                Task_B.Get_Result(Part_Array_B);
            end;
            Result := Merge(Part_Array_A, Part_Array_B);
        end;
    end Parallel_Merge_Sort;
end Parallel_Algorithms;
