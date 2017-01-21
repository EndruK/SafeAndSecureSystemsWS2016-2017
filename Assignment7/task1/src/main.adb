with Ada.Text_IO;
with gf2n;

procedure Main is

    type GF_2n is mod 2**8;

    package GF is new GF2n (
        Element_Type => GF_2n,
        P => 2#00011011#
    );

    X : constant GF_2n := 2#00000101#;
    Y : constant GF_2n := 2#00000011#;
    Temp : GF_2n;

begin
    Ada.Text_IO.Put_Line(X);

    Ada.Text_IO.Put_Line("########### MAIN ###########");
    Temp := GF."+"(X,Y);
    Ada.Text_IO.Put_Line(Temp'Image);
    Temp := GF."-"(X,Y);
    Ada.Text_IO.Put_Line(Temp'Image);
    Temp := GF."*"(X,Y);
    Ada.Text_IO.Put_Line(Temp'Image);
    Temp := GF."/"(X,Y);
    Ada.Text_IO.Put_Line(Temp'Image);
end Main;
