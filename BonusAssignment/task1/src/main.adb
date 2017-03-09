-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

-- Die Aufgabe in Kooperation mit Max Weber geloest.

with Lists;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
    procedure My_Put(Item : Integer) is
    begin
        Put(Item, Width => 0);
    end My_Put;
    package My_List_Package is new Lists(Item_Type => Integer, Put_Item => My_Put);
    use My_List_Package;
    My_List : List_Type;
begin
    Put_Line("########### MAIN ###########");
    Put_Line("");
    Append(My_List, 1);
    Append(My_List, 2);
    Append(My_List, 3);
    Append(My_List, 4);
    Append(My_List, 5);
    Insert(My_List, Pred(Last(My_List)), 33);
    Print(My_List);
    Put_Line("");
    Put_Line("");
    declare
        Temp : List_Iterator_Type_Acc := Pred(Pred(Pred(Last(My_List))));
    begin
        Delete(My_List, Temp);
    end;
    Print(My_List);
end Main;
