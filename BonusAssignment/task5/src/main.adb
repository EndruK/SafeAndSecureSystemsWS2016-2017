-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Password_Cracking;
with Password_Cracking_Context;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_line; use Ada.Command_line;

procedure Main is
    package PCC is new Password_Cracking_Context(Num_Password_Chars => 4, Num_Tasks => 2);
    package PC is new Password_Cracking(PCC);
    Success : Boolean := False;
    Filename : String := "hashfile";
    Task_Count : Natural;
    Max_Time : Natural;
    function Get_Hash_Count(Filename : in String) return Natural is
        Hash_Count : Natural := 0;
        Input_File : File_Type;
        Hash : PCC.Hash_Type;
    begin -- Get_Hash_Count
        Open(File => Input_File, Mode => In_File, Name => Filename);
        loop
            exit when End_Of_File(Input_File);
            Hash := Get_Line(Input_File);
            Hash_Count := Hash_Count + 1;
        end loop;
        Close(Input_File);
        return Hash_Count;
    end Get_Hash_Count;
begin
    Put_Line("########### MAIN ###########");
    -- Filename := Argument(1);
    -- Task_Count := Integer'Value(Argument(2));
    Task_Count := 2;
    Max_Time := 60;
    declare
        Input_File : File_Type;
        -- Hash_Count : Natural := Get_Hash_Count(Filename);
        Filename : constant String := "hashfile";
        Hash_Count : Natural := Get_Hash_Count(Filename);
        Hash_Array : PCC.Hash_Array_Type (Natural Range 1..Hash_Count);
        Password_Array : PCC.Password_Array_Type (Natural Range 1..Hash_Count);
        Index : Natural := 1;
    begin
        Open(File => Input_File, Mode => In_File, Name => Filename);
        loop
            exit when End_Of_File(Input_File);
            declare
                Hash : constant PCC.Hash_Type := Get_Line(Input_File);
            begin
                Hash_Array(Index) := Hash;
            end;
            Index := Index + 1;
        end loop;
        Close(Input_File);
        PC.Find_Passwords(Hash_Array, Password_Array, Success);
    end;
end Main;
