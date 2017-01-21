generic
    -- Example: A type GF_2_4_Type is mod 2**4 means that we consider the
    -- elements of Galois Field (2**8).
    type Element_Type is mod <>;

    -- An irreducible polynomial P required for arithmetics.
    P: Element_Type;
package GF2n is
    function "+"(X: Element_Type; Y: Element_Type) return Element_Type;
    function "-"(X: Element_Type; Y: Element_Type) return Element_Type;
    function "*"(X: Element_Type; Y: Element_Type) return Element_Type;
    function "/"(X: Element_Type; Y: Element_Type) return Element_Type;

    function Shift_Left
        (Value : Element_Type;
         Amount: Natural)
         return Element_Type;
    pragma Import (Intrinsic, Shift_Left);

    function Shift_Right
        (Value : Element_Type;
         Amount: Natural)
         return Element_Type;
    pragma Import (Intrinsic, Shift_Right);

    function Find_Inverse(X: Element_Type) return Element_Type;
    function GCD(X: Element_Type; Y: Element_Type) return Element_Type;
    function Is_Primitive(X: Element_Type) return Boolean;
end GF2n;
