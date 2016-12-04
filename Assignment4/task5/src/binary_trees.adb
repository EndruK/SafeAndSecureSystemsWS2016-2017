with Ada.Text_IO;
package body Binary_Trees is

    -- T is the given subgraph and T is the new object
    procedure Add_Item(T: in out Binary_Tree_Access; Item: Item_Type) is
        Leaf_Graph : Binary_Tree_Access;
    begin
        if T = Null then
            T := Create(Item);
        end if;

        if T.Item = Item then
            raise Item_Already_In_Tree_Exception;
            return;
        end if;

        if Item < T.Item then
            if T.Left /= Null then
                Add_Item(T.Left, Item);
            else
                Leaf_Graph := Create(Item);
                Leaf_Graph.Parent := T;
                T.Left := Leaf_Graph;
            end if;
        else
            if T.Right /= Null then
                Add_Item(T.Right, Item);
            else
                Leaf_Graph := Create(Item);
                Leaf_Graph.Parent := T;
                T.Right := Leaf_Graph;
            end if;
        end if;


    end Add_Item;

--------------------------------------------------------------------------------

    function Create(Item: Item_Type) return Binary_Tree_Access is
    begin
        return new Binary_Tree'(Item => Item,
                                Left => Null,
                                Right => Null,
                                Parent => Null);
    end Create;

--------------------------------------------------------------------------------

    function Has_Children(T: Binary_Tree_Access) return Boolean is
    begin
        return not (T.Right = Null and T.Left = Null);
    end Has_Children;

--------------------------------------------------------------------------------

    function Has_Item(T: Binary_Tree_Access; Item: Item_Type) return Boolean is
    begin
        if T = Null then
            return False;
        end if;

        if T.Item = Item then
            return True;
        end if;

        if Item < T.Item then
            return Has_Item(T.Left, Item);
        else
            return Has_Item(T.Right, Item);
        end if;
    end Has_Item;

--------------------------------------------------------------------------------

    function Get_Height(T: Binary_Tree_Access) return Natural is
        Height_Left : Natural := 0;
        Height_Right : Natural := 0;
    begin
        if T = Null then
            return 0;
        end if;

        if Has_Children(T) then
            Height_Left := Get_Height(T.Left);
            Height_Right := Get_Height(T.Right);
            if Height_Right >= Height_Left then
                return Height_Right + 1;
            else
                return Height_Left + 1;
            end if;
        else
            return 1;
        end if;
    end Get_Height;

--------------------------------------------------------------------------------

    function Get_Num_Leaves(T: Binary_Tree_Access) return Natural is
        Num_Leaves_Left : Natural := 0;
        Num_Leaves_Right : Natural := 0;
    begin
        if T = Null then
            return 0;
        end if;

        if Has_Children(T) then
            Num_Leaves_Left := Get_Num_Leaves(T.Left);
            Num_Leaves_Right := Get_Num_Leaves(T.Right);
            return Num_Leaves_Left + Num_Leaves_Right;
        else
            return 1;
        end if;
    end Get_Num_Leaves;

--------------------------------------------------------------------------------

    procedure Put(T: Binary_Tree_Access) is
        package T_IO renames Ada.Text_IO;
    begin
        if T = Null then
            return;
        end if;
        -- print first the items on the left
        Put(T.Left);
        -- print the item itself
        Put_Item(T.Item);
        T_IO.Put(" ");
        -- print the items on the right
        Put(T.Right);
    end Put;

--------------------------------------------------------------------------------

    function Find_To_Delete(T: Binary_Tree_Access;
                            Item: Item_Type) return Binary_Tree_Access is
    begin
        if T.Item = Item then
            return T;
        end if;
        if Item < T.Item then
            return Find_To_Delete(T.Left, Item);
        else
            return Find_To_Delete(T.Right, Item);
        end if;
    end Find_To_Delete;

--------------------------------------------------------------------------------

    procedure Remove_Item(T: in out Binary_Tree_Access; Item: Item_Type) is
        Subgraph_Left : Binary_Tree_Access;
        Subgraph_Right : Binary_Tree_Access;
        Delete_Node : Binary_Tree_Access;
        New_Node : Binary_Tree_Access;
        -- TODO: remove
        package T_IO renames Ada.Text_IO;
    begin
        -- if T is empty -> raise exception
        if T = Null then
            raise Binary_Tree_Empty_exception;
            return;
        end if;

        -- if T doesn't have the Item -> raise exception
        if not Has_Item(T, Item) then
            raise Item_Not_Found_Exception;
            return;
        end if;

        -- if T is root and has no children it is also a leave node
        -- delete it
        if not Has_Children(T) then
            Free(T);
        end if;

        -- get the node which has to be deleted
        Delete_Node := Find_To_Delete(T, Item);

        if Has_Children(Delete_Node) then
            -- get the left and right side of this node
            Subgraph_Left := Delete_Node.Left;
            Subgraph_Right := Delete_Node.Right;

            -- if the node has a left and right subgraph -> take the right subgraph
            if Subgraph_Left /= Null and Subgraph_Right /= Null then
                -- we have to find the min value of the right subgraph
                New_Node := Find_Right_Minimum(Subgraph_Right);

                -- remove the node from the subgraph to prevent loops
                if New_Node.Parent /= Null then
                    if New_Node.Parent.Left /= Null and then
                            New_Node.Parent.Left = New_Node then
                        New_Node.Parent.Left := Null;
                    elsif New_Node.Parent.Right /= Null and then
                            New_Node.Parent.Right = New_Node then
                        New_Node.Parent.Right := Null;
                    end if;
                end if;

                -- set the parent of the new node
                New_Node.Parent := Delete_Node.Parent;
                -- set the left side of the new node to the old left side
                New_Node.Left := Delete_Node.Left;
                -- set the right side of the new node to the old right side
                New_Node.Right := Delete_Node.Right;

                -- set the children of the parent of the old object
                if New_Node.Parent /= Null then
                    if New_Node.Parent.Left /= Null and then
                            New_Node.Parent.Left = Delete_Node then
                        New_Node.Parent.Left := New_Node;
                    elsif New_Node.Parent.Right /= Null and then
                            New_Node.Parent.Right = Delete_Node then
                        New_Node.Parent.Right := New_Node;
                    end if;
                end if;
            -- if the right subgraph is empty -> take the next node
            elsif Subgraph_Left = Null then
                -- set the right root node as new subgraph root node
                New_Node := Subgraph_Right;
                -- copy the old parent
                New_Node.Parent := Delete_Node.Parent;
                -- set the children of the parent items
                if New_Node.Parent /= Null and then
                        Delete_Node.Left = New_Node then
                    New_Node.Parent.Left := New_Node;
                elsif New_Node.Parent /= Null and then
                        Delete_Node.Right = New_Node then
                    New_Node.Parent.Right := New_Node;
                end if;
            -- if the left subgraph is empty -> take the next node
            elsif Subgraph_Right = Null then
                -- set the left root node as new subgraph root node
                New_Node := Subgraph_Left;
                -- copy the old parent
                New_Node.Parent := Delete_Node.Parent;
                -- set the children of the parent items
                if New_Node.Parent /= Null and then
                        Delete_Node.Left = New_Node then
                    New_Node.Parent.Left := New_Node;
                elsif New_Node.Parent /= Null and then
                        Delete_Node.Right = New_Node then
                    New_Node.Parent.Right := New_Node;
                end if;
            end if;
        else
            if Delete_Node.Parent /= Null and then
                    Delete_Node.Parent.Left = Delete_Node then
                Delete_Node.Parent.Left := Null;
            elsif Delete_Node.Parent /= Null and then
                    Delete_Node.Parent.Right = Delete_Node then
                Delete_Node.Parent.Right := Null;
            end if;
        end if;
        -- free the old node
        Free(Delete_Node);
    end Remove_Item;

--------------------------------------------------------------------------------

    function Find_Right_Minimum(Subtree: Binary_Tree_Access)
            return Binary_Tree_Access is
    begin
        if Subtree.Left = Null then
            return Subtree;
        end if;
        return Find_Right_Minimum(Subtree.Left);
    end Find_Right_Minimum;

--------------------------------------------------------------------------------

    procedure Remove_All(T: in out Binary_Tree_Access) is
    begin
        -- clear the children node of the parent node
        if T.Parent /= Null and then T.Parent.Left = T then
            T.Parent.Left := Null;
        elsif T.Parent /= Null and then T.Parent.Right = T then
            T.Parent.Right := Null;
        end if;
        -- go the down the tree and Free the items recursive
        if Has_Children(T) then
            if T.Left /= Null then
                Remove_All(T.Left);
            end if;
            if T.Right /= Null then
                Remove_All(T.Right);
            end if;
        end if;
        -- remove the item
        Free(T);
    end Remove_All;

end Binary_Trees;
