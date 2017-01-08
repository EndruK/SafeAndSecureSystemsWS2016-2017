-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Parallel_Algorithms;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array : My_Par_Alg.Array_Access_Type :=
       new My_Par_Alg.Array_Type(1..5);
    Result : Integer := 0;
    Tasks : Integer := 100;
begin -- Main
    for I in 1..5 loop
        My_Array(I) := 1;
    end loop;
    My_Par_Alg.Parallel_Sum(My_Array, Result, Tasks);
    Put(Result);
end Main;
