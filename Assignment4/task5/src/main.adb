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
    My_Tree := Bin_Int_Tree.Create(5);
    Bin_Int_Tree.Add_Item(My_Tree, 4);
    Bin_Int_Tree.Add_Item(My_Tree, 2);
    Bin_Int_Tree.Add_Item(My_Tree, 1);
    Bin_Int_Tree.Add_Item(My_Tree, 6);
    Bin_Int_Tree.Add_Item(My_Tree, 3);
    Bin_Int_Tree.Put(My_Tree);
    Bin_Int_Tree.Remove_All(My_Tree);
    Bin_Int_Tree.Put(My_Tree);
end Main;
