-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO; use Ada.Text_IO;
package body Lists is
    function First(List: List_Type) return List_Iterator_Type_Acc is
    begin
        if List.First = Null then
            raise Iterator_Error;
        end if;
        return List.First;
    end First;
--------------------------------------------------------------------------------
    function Last (List: List_Type)
            return List_Iterator_Type_Acc is
    begin
        if List.Last = Null then
            raise Iterator_Error;
        end if;
        return List.Last;
    end Last;
--------------------------------------------------------------------------------
    function Succ (Iterator: List_Iterator_Type_Acc)
            return List_Iterator_Type_Acc is
    begin
        if Iterator.Succ = Null then
            raise Iterator_Error;
        end if;
        return Iterator.Succ;
    end Succ;
--------------------------------------------------------------------------------
    function Pred (Iterator: List_Iterator_Type_Acc)
            return List_Iterator_Type_Acc is
    begin
        if Iterator.Pred = Null then
            raise Iterator_Error;
        end if;
        return Iterator.Pred;
    end Pred;
--------------------------------------------------------------------------------
    function Value(Iterator: List_Iterator_Type_Acc) return Item_Type is
    begin
        return Iterator.Value;
    end Value;
--------------------------------------------------------------------------------
    function Size (List: List_Type) return Natural is
        First_Item : constant List_Iterator_Type_Acc := List.First;
        Current_Item : List_Iterator_Type_Acc := First_Item;
        Last_Item : constant List_Iterator_Type_Acc := List.Last;
        Count : Natural := 1;
    begin
        if First_Item = Null or Last_Item = Null then
            return 0;
        end if;
        if First(List) = Last(List) then
            return 1;
        end if;
        while Current_Item.Succ /= Null loop
            Count := Count + 1;
            declare
                Succ : constant List_Iterator_Type_Acc := Current_Item.Succ;
            begin
                Current_Item := Succ;
            end;
        end loop;
        return Count;
    end Size;
--------------------------------------------------------------------------------
    procedure Append(List: in out List_Type; Item: Item_Type) is
        Last_Item : constant List_Iterator_Type_Acc := List.Last;
        New_Item : constant List_Iterator_Type_Acc := new List_Iterator_Type;
    begin
        New_Item.Value := Item;
        List.Last := New_Item;
        New_Item.Succ := Null;
        -- check if the list is not empty
        if Last_Item /= Null then
            Last_Item.Succ := New_Item;
            New_Item.Pred := Last_Item;
        else
            New_Item.Pred := Null;
            List.First := New_Item;
        end if;
    end Append;
--------------------------------------------------------------------------------
    procedure Prepend(List: in out List_Type; Item: Item_Type) is
        First_Item : constant List_Iterator_Type_Acc := List.First;
        New_Item : constant List_Iterator_Type_Acc := new List_Iterator_Type;
    begin
        New_Item.Value := Item;
        List.First := New_Item;
        New_Item.Pred := Null;
        if First_Item /= Null then
            First_Item.Pred := New_Item;
            New_Item.Succ := First_Item;
        else
            New_Item.Succ := Null;
            List.Last := New_Item;
        end if;
    end Prepend;
--------------------------------------------------------------------------------
   procedure Insert(List: in out List_Type;
                     Iterator: in List_Iterator_Type_Acc;
                     Item: Item_Type) is
        New_Item : constant List_Iterator_Type_Acc := new List_Iterator_Type;
        Old_Pred : constant List_Iterator_Type_Acc := Iterator.Pred;
    begin
        if Iterator = Null then
            raise Iterator_Error;
        end if;
        New_Item.Value := Item;
        New_Item.Succ := Iterator;
        Iterator.Pred := New_Item;
        if Old_Pred /= Null then
            Old_Pred.Succ := New_Item;
            New_Item.Pred := Old_Pred;
        else
            List.First := New_Item;
            New_Item.Pred := Null;
        end if;
    end Insert;
--------------------------------------------------------------------------------
    procedure Delete(List: in out List_Type;
                     Iterator: in out List_Iterator_Type_Acc) is
    begin
        if Iterator = Null then
            raise Iterator_Error;
        end if;
        if Iterator.Succ = Null and Iterator.Pred = Null then
            -- Iterator is only remaining element in list
            List.First := Null;
            List.Last := Null;
        elsif Iterator.Pred = Null and Iterator.Succ /= Null then
            -- Iterator is first element of list
            Iterator.Succ.Pred := Null;
            List.First := Iterator.Succ;
        elsif Iterator.Succ = Null and Iterator.Pred /= Null then
            -- Iterator is last element of list
            Iterator.Pred.Succ := Null;
            List.Last := Iterator.Pred;
        else
            -- Iterator is somewhere between first and last
            Iterator.Succ.Pred := Iterator.Pred;
            Iterator.Pred.Succ := Iterator.Succ;
        end if;
        Free(Iterator);
    end Delete;
--------------------------------------------------------------------------------
    procedure Print(List : in List_Type) is
    begin
        if List.First = Null or List.Last = Null then
            Put("Empty");
        else
            declare
                Current_Item : List_Iterator_Type_Acc := List.First;
                Temp : List_Iterator_Type_Acc;
            begin
                while Current_Item /= Null loop
                    Temp := Current_Item.Succ;
                    Put_Item(Current_Item.Value);
                    Put_line("");
                    Current_Item := Temp;
                end loop;
            end;
        end if;
    end Print;
end Lists;
