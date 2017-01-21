with Ada.Text_IO;
package body GF2n is

    function "+"(X: Element_Type; Y: Element_Type) return Element_Type is
        -- Temp : Element_Type;
    begin
        Ada.Text_IO.Put_Line("+");
        return X XOR Y;
    end "+";

    function "-"(X: Element_Type; Y: Element_Type) return Element_Type is
        -- Temp : Element_Type;
    begin
        Ada.Text_IO.Put_Line("-");
        return X XOR Y;
    end "-";

    function "*"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        Ada.Text_IO.Put_Line("*");
        return Shift_Left(X, 1);
    end "*";

    function "/"(X: Element_Type; Y: Element_Type) return Element_Type is
        -- Temp : Element_Type;
    begin
        Ada.Text_IO.Put_Line("/");
        return Shift_Right(X, 1);
    end "/";

    function Find_Inverse(X: Element_Type) return Element_Type is
        -- Temp : Element_Type;
    begin
        Ada.Text_IO.Put_Line("Find_Inverse");
        return X;
    end Find_Inverse;

    function GCD(X: Element_Type; Y: Element_Type) return Element_Type is
        -- Temp : Element_Type;
    begin
        Ada.Text_IO.Put_Line("GCD");
        return X;
    end GCD;

    function Is_Primitive(X: Element_Type) return Boolean is
        -- Temp : Element_Type;
    begin
        Ada.Text_IO.Put_Line("Is_Primitive");
        return True;
    end Is_Primitive;
end GF2n;
