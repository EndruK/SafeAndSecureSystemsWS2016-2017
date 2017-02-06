generic
    type Item_Type is private;
package Lists is
    type List_Type is tagged private;
    type List_Iterator_Type is private;

    function First(List: List_Type) return List_Iterator_Type;
    -- Returns an Iterator that points to the first item of the list.
    function Last (List: List_Type) return List_Iterator_Type;
    -- Returns an Iterator that points to the last item of the list.
    function Succ (Iterator: List_Iterator_Type) return List_Iterator_Type;
    -- Returns Iterator_Error if Iterator is null or points to the last item.
    function Pred (Iterator: List_Iterator_Type) return List_Iterator_Type;
    -- Returns Iterator_Error if Iterator is null or points to the first item.
    function Value(Iterator: List_Iterator_Type) return Item_Type;
    -- Returns the value at the current position of Iterator.
    -- Returns Iterator_Error if Iterator is null or list is empty.
    function Size (List: List_Type) return Natural;

    procedure Append(List: in out List_Type; Item: Item_Type);
    -- Appends Item to the last position of the list.
    procedure Prepend(List: in out List_Type; Item: Item_Type);
    -- Prepends Item at the first position of the list.
    procedure Insert(Iterator: in out List_Iterator_Type; Item: Item_Type);
    -- Inserts Item before the current position of Iterator.
    -- Sets Iterator to the new item.
    -- Raises Iterator_Error if the list of Iterator is null.
    procedure Delete(Iterator: in out List_Iterator_Type);
    -- Deletes the current Item of Iterator.
    -- Sets Iterator to the Item that came after the deleted item or to
    -- the new last Item if the previous last Item was deleted.
    -- Raises Iterator_Error if Iterator is null or points to no item.

    Iterator_Error: exception;
private
    type List_Iterator_Type is record
        Pred : Access List_Iterator_Type := Null;
        Succ : Access List_Iterator_Type := Null;
        Value : Item_Type;
    end record;
    type List_Type is tagged record
        First : Access List_Iterator_Type := Null;
        Last : Access List_Iterator_Type := Null;
        Size : Natural := 0;
    end record;
end Lists;
