package body Lists is
    function First(List: List_Type) return List_Iterator_Type is
    begin
        if List.First = Null then
            raise Iterator_Error;
        end if;
        return List.First.all;
    end First;
--------------------------------------------------------------------------------
    function Last (List: List_Type) return List_Iterator_Type is
    begin
        if List.Last = Null then
            raise Iterator_Error;
        end if;
        return List.Last.all;
    end Last;
--------------------------------------------------------------------------------
    function Succ (Iterator: List_Iterator_Type) return List_Iterator_Type is
    begin
        if Iterator.Succ = Null then
            raise Iterator_Error;
        end if;
        return Iterator.Succ.all;
    end Succ;
--------------------------------------------------------------------------------
    function Pred (Iterator: List_Iterator_Type) return List_Iterator_Type is
    begin
        if Iterator.Pred = Null then
            raise Iterator_Error;
        end if;
        return Iterator.Pred.all
    end Pred;
--------------------------------------------------------------------------------
    function Value(Iterator: List_Iterator_Type) return Item_Type is
    begin
        return Iterator.Value;
    end Value;
--------------------------------------------------------------------------------
    function Size (List: List_Type) return Natural is
    begin
        return List.Size;
    end Size;
--------------------------------------------------------------------------------
    procedure Append(List: in out List_Type; Item: Item_Type) is
        Last_Item : Access List_Iterator_Type := List.Last;
        New_Item : Access List_Iterator_Type := new List_Iterator_Type;
    begin
        New_Item.Value := Item;
        List.Last := New_Item;
        List.Size := List.Size + 1;
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
        First_Item : Access List_Iterator_Type := List.First;
        New_Item : Access List_Iterator_Type := new List_Iterator_Type;
    begin
        New_Item.Value := Item;
        List.First := New_Item;
        List.Size := List.Size + 1;
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
    procedure Insert(Iterator: in out List_Iterator_Type; Item: Item_Type) is
    begin
        Null;
    end Insert;
--------------------------------------------------------------------------------
    procedure Delete(Iterator: in out List_Iterator_Type) is
    begin
        Null;
    end Delete;
end Lists;
