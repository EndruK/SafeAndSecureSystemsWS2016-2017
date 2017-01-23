with Ada.Text_IO, gf2n;

procedure Main is

    type GF_2n is mod 2**4;

    package GF is new GF2n (
        Element_Type => GF_2n,
        P => 2#0011#
    );

    Y : constant GF_2n := 2#1010#;
    X : constant GF_2n := 2#0011#;
    Temp : GF_2n;
    Temp_Bool : Boolean;

begin
    Ada.Text_IO.Put_Line("########### MAIN ###########");

    Temp := GF."+"(X,Y);
    Ada.Text_IO.Put_Line(Temp'Image);

    Temp := GF."-"(X,Y);
    Ada.Text_IO.Put_Line(Temp'Image);

    Temp := GF."/"(X,Y);
    Ada.Text_IO.Put_Line(Temp'Image);

    Temp := GF."*"(X, Y);
    Ada.Text_IO.Put_Line(Temp'Image);

    Temp := GF.GCD(X, Y);
    Ada.Text_IO.Put_Line(Temp'Image);

    Temp := GF.Find_Inverse(X);
    Ada.Text_IO.Put_Line(Temp'Image);
    
    Temp_Bool := GF.Is_Primitive(X);
    Ada.Text_IO.Put_Line(Temp_Bool'Image);
end Main;
