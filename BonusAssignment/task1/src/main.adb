-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Lists;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
    package My_List_Package is new Lists(Item_Type => Integer);
    use My_List_Package;
    My_List : List_Type;
    My_List_2 : List_Type;
begin
    Put_Line("########### MAIN ###########");
    Put_Line("");
    -- Put(Size(My_List));
    Append(My_List, 3);
    Append(My_List, 2);
    Append(My_List_2, 30);
    Put(Value(Last(My_List)));
    Put(Value(Last(My_List_2)));
end Main;
