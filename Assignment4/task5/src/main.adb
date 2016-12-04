-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Binary_Trees;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
    procedure My_Put(Item : Integer) is
    begin
        Put(Item, Width => 0);
    end My_Put;
    package Binary_Integer_Tree is new Binary_Trees(Item_Type => Integer, -- Int type
                                             "<" => "<", -- use standard compare
                                             "=" => "=", -- use standard equal
                                             Put_Item => My_Put);
    package Bin_Int_Tree renames Binary_Integer_Tree;
    My_Tree : Bin_Int_Tree.Binary_Tree_Access;
begin -- Main
    -- My_Tree := Bin_Int_Tree.Create(4);
    -- Bin_Int_Tree.Add_Item(My_Tree, 10);
    -- Bin_Int_Tree.Add_Item(My_Tree, 7);
    -- Bin_Int_Tree.Add_Item(My_Tree, 5);
    -- Bin_Int_Tree.Add_Item(My_Tree, 2);
    -- Bin_Int_Tree.Add_Item(My_Tree, 6);
    -- Bin_Int_Tree.Add_Item(My_Tree, 12);
    -- Bin_Int_Tree.Add_Item(My_Tree, 9);
    -- Bin_Int_Tree.Add_Item(My_Tree, 8);
    -- Bin_Int_Tree.Add_Item(My_Tree, 1);
    -- Bin_Int_Tree.Add_Item(My_Tree, 11);

    My_Tree := Bin_Int_Tree.Create(5);
    Bin_Int_Tree.Add_Item(My_Tree, 4);
    Bin_Int_Tree.Add_Item(My_Tree, 2);
    Bin_Int_Tree.Add_Item(My_Tree, 1);
    Bin_Int_Tree.Add_Item(My_Tree, 6);
    Bin_Int_Tree.Add_Item(My_Tree, 3);


    -- if Bin_Int_Tree.Has_Children(My_Tree) then
    --     Put("True");
    -- else
    --     Put("False");
    -- end if;
    -- Put(Bin_Int_Tree.Get_Height(My_Tree));
    -- Put(Bin_Int_Tree.Get_Num_Leaves(My_Tree));
    -- Bin_Int_Tree.Remove_Item(My_Tree, 1);
    -- Bin_Int_Tree.Remove_Item(My_Tree, 4);
    -- Bin_Int_Tree.Remove_Item(My_Tree, 3);
    -- Bin_Int_Tree.Remove_Item(My_Tree, 2);
    -- Bin_Int_Tree.Remove_Item(My_Tree, 4);
    -- Bin_Int_Tree.Remove_Item(My_Tree, 2);
    Bin_Int_Tree.Remove_All(My_Tree);
    Put_Line("");
    Bin_Int_Tree.Put(My_Tree);
    -- Bin_Int_Tree.Put(Bin_Int_Tree.Find_To_Delete(My_Tree, 4));
end Main;
