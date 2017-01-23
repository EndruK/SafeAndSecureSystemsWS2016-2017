with Ada.Text_IO, Ada.Integer_Text_IO;
package body GF2n is

    function "+"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        Ada.Text_IO.Put_Line("+");
        return (X XOR Y) mod P;
    end "+";

    function "-"(X: Element_Type; Y: Element_Type) return Element_Type is
    begin
        Ada.Text_IO.Put_Line("-");
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
                Ada.Text_IO.Put_Line("False");
                return False;
            end if;
        end loop;
        Ada.Text_IO.Put_Line("Is_Primitive");
        Ada.Text_IO.Put_Line("True");
        return True;
    end Is_Primitive;

--      function Get_Bit(Target: In Element_Type) return String is
--          Target_Integer : Integer := Integer'Value(Target'Image);
--          Target_String : String (1 .. 32) ;
--      begin
--          Ada.Integer_Text_IO.Put(To=>Target_String, Item=>Target_Integer, Base=>2);
--          return Target_String;
--      end Get_Bit;
--
--      function Get_Order(Target: In Element_Type) return Integer is
--          Target_As_Bit_String : String (1 .. 32) ;
--          -- Target_As_Bit_String : String := Get_Bit(Target);
--          Target_MSB : Integer := 0;
--      begin
--          Target_As_Bit_String := Get_Bit(Target);
--          for I in Target_As_Bit_String'First .. Target_As_Bit_String'Last loop
--              if Target_As_Bit_String(I) = '1' and Target_MSB = 0 then
--                  Target_MSB := Target_As_Bit_String'Last - I;
--              end if;
--          end loop;
--          return Target_MSB;
--      end Get_Order;
--
--     function Shift_Left (Value : Element_Type; Amount: Natural) return Element_Type is
--         Value_as_String : String (1 .. 32);
--         Value_Order : Integer;
--         Result : Element_Type;
--     begin
--         Value_as_String := Get_Bit(Value);
--         Value_Order := Get_Order(Value);
--         for I in reverse Amount .. Value_as_String'Last loop-- - (Value_Order + Amount) loop
--             if Value_as_String(I) = '1' then
--                 Value_as_String(I - Amount) := Value_as_String(I);
--                 Value_as_String(I) := '0';
--             end if;
--         end loop;
--         for I in reverse Value_as_String'Last .. Value_as_String'Last - Amount loop
--             Value_as_String(I) := '0';
--         end loop;
--         Result := Element_Type'Value(Value_as_String);
--         return Result;
--     end Shift_Left;
--
--     function Shift_Right (Value : Element_Type; Amount: Natural) return Element_Type is
--     begin
--         return 0;
--     end Shift_Right;

--    function "*"(X: Element_Type; Y: Element_Type) return Element_Type is
--        Y_As_Bit_String : String (1 .. 32);
--        Temp : Element_Type;
--        I_LSB : Integer := Integer'Last;
--        Shift_By : Integer;
--    begin
--        Ada.Text_IO.Put_Line("*");
--        Y_As_Bit_String := Get_Bit(Y);
--        Ada.Text_IO.Put_Line(Y_As_Bit_String);
--        for I in reverse Y_As_Bit_String'First .. Y_As_Bit_String'Last loop
--            -- Ada.Text_IO.Put(I'Image);
--            -- Ada.Text_IO.New_Line;
--
--            if Y_As_Bit_String(I) = '1' then
--                Ada.Text_IO.Put(I'Image);
--
--                --Ada.Text_IO.Put_Line("" & Y_As_Bit_String(I));
--                Shift_By := Y_As_Bit_String'Last - I -1;
--                if Shift_By < I_LSB then
--                    I_LSB := Shift_By;
--                    Temp := Shift_Left(X, Shift_By);
--                    Ada.Text_IO.Put("I_LSB: ");
--                    Ada.Text_IO.Put_Line(Get_bit(Temp));
--                elsif Shift_By /= 0 then
--                    Ada.Text_IO.Put("Shift_By'Image: ");
--                    Ada.Text_IO.Put_Line(Shift_By'Image);
--
--                    Temp := Temp xor Shift_Left(X, Shift_By);
--                    Ada.Text_IO.Put_Line(Get_bit(Temp));
--                end if;
--            end if;
--        end loop;
--        Ada.Text_IO.Put_Line(Get_bit(X));
--        Ada.Text_IO.Put_Line(Get_bit(Y));
--        Ada.Text_IO.Put_Line(Get_bit(Temp));
--        Ada.Text_IO.Put("Get_Order: ");
--        Ada.Text_IO.Put_Line(Get_Order(Temp)'Image);
--
--        return Temp;--"/"(Temp, P);
--    end "*";

--    function "/"(X: Element_Type; Y: Element_Type) return Element_Type is
--        Temp_As_Bit_String : String (1 .. 32);
--        P_As_Bit_String : String (1 .. 32);
--        P_Shifted : Element_Type;
--        Temp : Element_Type := X;
--        Temp_MSB : Integer;
--        P_MSB : Integer;
--    begin
--        P_MSB := Get_Order(P);
--        Temp_MSB := Get_Order(X);
--        Temp_As_Bit_String := Get_Bit(Temp);
--        P_As_Bit_String := Get_Bit(P);
--        while Temp_MSB >= P_MSB loop
--            for I in reverse Temp_As_Bit_String'First .. Temp_As_Bit_String'Last loop
--                if Temp_As_Bit_String(I) = '1' then
--                    Temp_MSB := I;
--                end if;
--            end loop;
--            for I in reverse P_As_Bit_String'First .. P_As_Bit_String'Last loop
--                if P_As_Bit_String(I) = '1' then
--                    P_MSB := I;
--                end if;
--            end loop;
--            P_Shifted := Shift_Left(P, Temp_MSB - P_MSB);
--            Temp := Temp xor P_Shifted;
--            Temp_MSB := Get_Order(Temp);
--
--        end loop;
--
--        Ada.Text_IO.Put_Line("/");
--        return Shift_Right(Temp, 1);
--    end "/";
end GF2n;
