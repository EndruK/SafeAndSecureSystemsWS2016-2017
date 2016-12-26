-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Parallel_Algorithms;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
    package My_Par_Alg is new Parallel_Algorithms(Item_Type => Integer,
                                                  "+" => "+");
    My_Array_Access : My_Par_Alg.Array_Access_Type;
begin -- Main
    My_Array_Access := new My_Par_Alg.Array_Type'(1,2,3,4);
    Put(My_Array_Access(0));
end Main;
