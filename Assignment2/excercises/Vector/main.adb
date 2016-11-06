-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO, Ada.Float_Text_IO, Vectors;
use Ada.Text_IO, Ada.Float_Text_IO, Vectors;
procedure Main is
    V1 : Vector;
    V2 : Vector;
    V3 : Vector;
begin -- Main
    V1.X := 1.0;
    V1.Y := 2.0;
    V1.Z := 3.0;

    V2.X := 4.0;
    V2.Y := 5.0;
    V2.Z := 6.0;


    V3 := V1 * 3.0;
    Put(V3);
    Put(V1+V2);
    Put(V1-V2);
    Put(Boolean'Image(V1=V2));
    New_Line;
    Put(Boolean'Image(V1=(1.0,2.0,3.0)));
    New_Line;
    Put(Boolean'Image(Are_Orthogonal((1.0,0.0,0.0),(0.0,1.0,0.0))));
    New_Line;
    Put(Cross_Product(V1,V2));
    Put(Distance(V1,V2),Exp=>0);
    New_Line;
    Put(Distance_To_Origin(V1),Exp=>0);
    New_Line;
    Put(Distance_To_Origin((1.0,0.0,0.0)),Exp=>0);
end Main;
