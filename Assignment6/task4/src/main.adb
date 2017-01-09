-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Parallel_Algorithms;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
    procedure My_Put(Item : Integer) is
    begin
        Put(Item, Width => 0);
    end My_Put;
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "<" => "<",
                                                  Put_Item => My_Put);
    My_Array : constant My_Par_Alg.Array_Access_Type :=
       new My_Par_Alg.Array_Type'(38,27,43,3,9,82,10);
    Sorted_Array : My_Par_Alg.Array_Access_Type;
begin -- Main
    My_Par_Alg.Parallel_Merge_Sort(My_Array, Sorted_Array);
    My_Par_Alg.Print_Array(My_Array);
    Put_Line("");
    My_Par_Alg.Print_Array(Sorted_Array);
end Main;
