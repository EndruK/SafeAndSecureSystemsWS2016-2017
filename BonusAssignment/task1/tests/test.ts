context with Lists;
        with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;
        with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
define  procedure My_Put_Char(Item : Character) is
        begin
            Put(Item);
        end My_Put_Char;
        procedure My_Put_Int(Item : Integer) is
        begin
            Put(Item, Width => 10);
        end My_Put_Int;
        package My_List_Instance_Char is new Lists(Item_Type => Character, Put_Item => My_Put_Char);
        package My_List_Instance_Int is new Lists(Item_Type => Integer, Put_Item => My_Put_Int);
        package LC renames My_List_Instance_Char;
        package LI renames My_List_Instance_Int;
code    Ada.Text_IO.Put_Line("Begin testing: ");

***** append nothing to list
define  My_List : LI.List_Type;
        Error_Thrown_First : Boolean := False;
        Error_Thrown_Last : Boolean := False;
        Iterator : LI.List_Iterator_Type_Acc;
test    begin
            Iterator := LI.First(My_List);
        exception
            when LI.Iterator_Error => Error_Thrown_First := True;
        end;
        begin
            Iterator := LI.Last(My_List);
        exception
            when LI.Iterator_Error => Error_Thrown_Last := True;
        end;
pass    Error_Thrown_First and Error_Thrown_Last

***** append element to list
define  My_List : LI.List_Type;
        Iterator : LI.List_Iterator_Type_Acc;
        Element : Integer := 2;
        Size : Natural;
        Result_First : Integer;
        Result_Last : Integer;
        Error_Thrown_First_Succ : Boolean := False;
        Error_Thrown_Last_Pred : Boolean := False;
test    LI.Append(My_List, Element);
        Size := LI.Size(My_List);
        Result_First := LI.Value(LI.First(My_List));
        Result_Last := LI.Value(LI.Last(My_List));
        begin
            Iterator := LI.Succ(LI.First(My_List));
        exception
            when LI.Iterator_Error => Error_Thrown_First_Succ := True;
        end;
        begin
            Iterator := LI.Pred(LI.Last(My_List));
        exception
            when LI.Iterator_Error => Error_Thrown_Last_Pred := True;
        end;
pass    Size = 1 and Result_First = Element and Result_First = Result_Last
        and Error_Thrown_Last_Pred and Error_Thrown_Last_Pred
