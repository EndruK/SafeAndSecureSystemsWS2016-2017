with Ada.Unchecked_Deallocation;
generic
    type Item_Type is private;
    with procedure Put_Item(Item: Item_Type);
package Lists is
    type List_Type is tagged private;
    type List_Iterator_Type is private;
    type List_Iterator_Type_Acc is private;

    function First(List: List_Type) return List_Iterator_Type_Acc;
    -- Returns an Iterator that points to the first item of the list.
    function Last (List: List_Type) return List_Iterator_Type_Acc;
    -- Returns an Iterator that points to the last item of the list.
    function Succ (Iterator: List_Iterator_Type_Acc) return List_Iterator_Type_Acc;
    -- Returns Iterator_Error if Iterator is null or points to the last item.
    function Pred (Iterator: List_Iterator_Type_Acc) return List_Iterator_Type_Acc;
    -- Returns Iterator_Error if Iterator is null or points to the first item.
    function Value(Iterator: List_Iterator_Type_Acc) return Item_Type;
    -- Returns the value at the current position of Iterator.
    -- Returns Iterator_Error if Iterator is null or list is empty.
    function Size (List: List_Type) return Natural;

    procedure Append(List: in out List_Type; Item: Item_Type);
    -- Appends Item to the last position of the list.
    procedure Prepend(List: in out List_Type; Item: Item_Type);
    -- Prepends Item at the first position of the list.
    procedure Insert(List: in out List_Type;
                     Iterator: in List_Iterator_Type_Acc;
                     Item: Item_Type);
    -- Inserts Item before the current position of Iterator.
    -- Sets Iterator to the new item.
    -- Raises Iterator_Error if the list of Iterator is null.
    procedure Delete(List: in out List_Type;
                     Iterator: in out List_Iterator_Type_Acc);
    -- Deletes the current Item of Iterator.
    -- Sets Iterator to the Item that came after the deleted item or to
    -- the new last Item if the previous last Item was deleted.
    -- Raises Iterator_Error if Iterator is null or points to no item.

    procedure Print(List : in List_Type);

    Iterator_Error: exception;
private
    type List_Iterator_Type_Acc is Access List_Iterator_Type;
    type List_Iterator_Type is record
        Pred : List_Iterator_Type_Acc := Null;
        Succ : List_Iterator_Type_Acc := Null;
        Value : Item_Type;
    end record;
    type List_Type is tagged record
        First : List_Iterator_Type_Acc := Null;
        Last : List_Iterator_Type_Acc := Null;
    end record;
    procedure Free is new Ada.Unchecked_Deallocation(
        Object => List_Iterator_Type, Name => List_Iterator_Type_Acc
    );
end Lists;
