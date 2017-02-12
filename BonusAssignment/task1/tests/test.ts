-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
context with Lists;
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
        Element : constant Integer := 2;
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
        and Error_Thrown_First_Succ and Error_Thrown_Last_Pred

***** Append Char to List
define  My_List : LC.List_Type;
        Iterator : LC.List_Iterator_Type_Acc;
        Element : constant Character := 'c';
        Size : Natural;
        Result_First : Character;
        Result_Last : Character;
        Error_Thrown_First_Succ : Boolean := False;
        Error_Thrown_Last_Pred : Boolean := False;
test    LC.Append(My_List, Element);
        Size := LC.Size(My_List);
        Result_First := LC.Value(LC.First(My_List));
        Result_Last := LC.Value(LC.Last(My_List));
        begin
            Iterator := LC.Succ(LC.First(My_List));
        exception
            when LC.Iterator_Error => Error_Thrown_First_Succ := True;
        end;
        begin
            Iterator := LC.Pred(LC.Last(My_List));
        exception
            when LC.Iterator_Error => Error_Thrown_Last_Pred := True;
        end;
pass    Size = 1 and Result_First = Element and Result_First = Result_Last
        and Error_Thrown_First_Succ and Error_Thrown_Last_Pred

***** Append multiple elements to list
define  My_List : LI.List_Type;
        type My_Array_Type is array(Natural range 1..5) of Integer;
        Elements : constant My_Array_Type := (20, 5, 2, 103, 9);
        Size : Natural;
        Result_First, Result_Sec, Result_Third,
            Result_Fourth, Result_Last : Integer;
test    LI.Append(My_List, Elements(1));
        LI.Append(My_List, Elements(2));
        LI.Append(My_List, Elements(3));
        LI.Append(My_List, Elements(4));
        LI.Append(My_List, Elements(5));
        Size := LI.Size(My_List);
        Result_First := LI.Value(LI.First(My_List));
        Result_Sec := LI.Value(LI.Succ(LI.First(My_List)));
        Result_Third := LI.Value(LI.Succ(LI.Succ(LI.First(My_List))));
        Result_Fourth := LI.Value(LI.Pred(LI.Last(My_List)));
        Result_Last := LI.Value(LI.Last(My_List));
pass    Size = 5 and Result_First = Elements(1) and Result_Sec = Elements(2)
        and Result_Third = Elements(3) and Result_Fourth = Elements(4)
        and Result_Last = Elements(5)

***** Prepend test
define  My_List : LI.List_Type;
        Size : Natural;
test    LI.Append(My_List, 2);
        LI.Prepend(My_List, 132);
        Size := LI.Size(My_List);
pass    Size = 2 and LI.Value(LI.First(My_List)) = 132 and LI.Value(LI.Last(My_List)) = 2

***** Prepend test 2
define  My_List : LI.List_Type;
        Size : Natural;
test    LI.Append(My_List, 1);
        LI.Append(My_List, 2);
        LI.Append(My_List, 3);
        LI.Prepend(My_List, 132);
        Size := LI.Size(My_List);
pass    Size = 4 and LI.Value(LI.First(My_List)) = 132 and LI.Value(LI.Last(My_List)) = 3

***** Get First Test
define  My_List : LI.List_Type;
        Size : Natural;
test    LI.Prepend(My_List, 4);
        LI.Append(My_List, 1);
        LI.Append(My_List, 2);
        LI.Prepend(My_List, 5);
        LI.Prepend(My_List, 6);
        LI.Append(My_List, 3);
        Size := LI.Size(My_List);
pass    Size = 6 and LI.Value(LI.First(My_List)) = 6

***** Get Last Test
define  My_List : LI.List_Type;
        Size : Natural;
test    LI.Prepend(My_List, 4);
        LI.Append(My_List, 1);
        LI.Prepend(My_List, 5);
        LI.Append(My_List, 2);
        LI.Append(My_List, 3);
        LI.Prepend(My_List, 6);
        Size := LI.Size(My_List);
pass    Size = 6 and LI.Value(LI.Last(My_List)) = 3

***** Get Succ of Item
define  My_List : LI.List_Type;
        Size : Natural;
        Iterator : LI.List_Iterator_Type_Acc;
test    LI.Append(My_List, 3);
        LI.Append(My_List, 31);
        LI.Append(My_List, 65);
        LI.Append(My_List, 6);
        LI.Append(My_List, 62);
        Iterator := LI.First(My_List);
        declare
            Temp : constant LI.List_Iterator_Type_Acc := LI.Succ(Iterator);
        begin
            Iterator := Temp;
        end;
        Size := LI.Size(My_List);
pass    Size = 5 and LI.Value(Iterator) = 31

***** Get Pred of Item
define  My_List : LI.List_Type;
        Size : Natural;
        Iterator : LI.List_Iterator_Type_Acc;
test    LI.Append(My_List, 3);
        LI.Append(My_List, 31);
        LI.Append(My_List, 65);
        LI.Append(My_List, 6);
        LI.Append(My_List, 62);
        Iterator := LI.Last(My_List);
        declare
            Temp : constant LI.List_Iterator_Type_Acc := LI.Pred(Iterator);
        begin
            Iterator := Temp;
        end;
        Size := LI.Size(My_List);
pass    Size = 5 and LI.Value(Iterator) = 6

***** Test insert
define  My_List : LI.List_Type;
        Size : Natural;
        Iterator : LI.List_Iterator_Type_Acc;
prepare LI.Append(My_List, 1);
        LI.Append(My_List, 2);
        LI.Append(My_List, 3);
        LI.Append(My_List, 4);
        LI.Append(My_List, 5);
        LI.Append(My_List, 6);
        LI.Append(My_List, 7);
        LI.Append(My_List, 8);
        LI.Append(My_List, 9);
        Iterator := LI.Succ(LI.Succ(LI.Succ(LI.First(My_List))));
test    LI.Insert(My_List, Iterator, 999);
        Size := LI.Size(My_List);
pass    LI.Value(LI.Succ(LI.Succ(LI.Succ(LI.First(My_List))))) = 999
        and LI.Value(LI.Succ(LI.Succ(LI.First(My_List)))) = 3
        and LI.Value(LI.Succ(LI.Succ(LI.Succ(LI.Succ(LI.First(My_List)))))) = 4
        and Size = 10

***** Test Delete
define  My_List : LI.List_Type;
        Iterator : LI.List_Iterator_Type_Acc;
        Size : Natural;
prepare LI.Append(My_List,2);
        Iterator := LI.First(My_List);
test    LI.Delete(My_List, Iterator);
        Size := LI.Size(My_List);
pass    Size = 0
