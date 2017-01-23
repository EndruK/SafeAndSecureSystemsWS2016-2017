with Ada.Text_IO, Ada.Integer_Text_IO;
package body GF2n is

    function "+"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        return (X XOR Y) mod P;
    end "+";

    function "-"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        return (X XOR Y) mod P;
    end "-";

    function "*"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        return (X AND Y) mod P;
    end "*";

    function "/"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        return (X AND Find_Inverse(Y)) mod P;
    end "/";

    function Find_Inverse(X: Element_Type) return Element_Type is
    begin
        for Iterator in 1 .. Element_Type'Last loop
            if (Iterator * X = 1) then
                return Iterator;
            end if;
        end loop;
        return -1;
    end Find_Inverse;

    function GCD(X: Element_Type; Y: Element_Type) return Element_Type is
        R : Element_Type := Element_Type'Last;
        Xi : Element_Type := 0;
        Yi : Element_Type := 0;
    begin
        if X < Y then
            Xi := Y;
            Yi := X;
        else
            Xi := X;
            Yi := Y;
        end if;
        GCD_Loop : loop
            for Q in reverse 1..Xi loop
                if Q * Yi <= Xi then
                    R := Xi - (Q * Yi);
                    exit GCD_Loop when R = 0;
                    Xi := Yi;
                    Yi := R;
                end if;
            end loop;
        end loop GCD_Loop;

        return Yi;
    end GCD;

    function Is_Primitive(X: Element_Type) return Boolean is
    begin
        for Iterator in 1 .. Natural(Element_Type'Last) -1 loop
            if (X**Iterator mod P) /= 1 then
                return False;
            end if;
        end loop;
        return True;
    end Is_Primitive;
end GF2n;
