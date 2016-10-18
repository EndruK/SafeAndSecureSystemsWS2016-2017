-- André Karge 110033
-- Kai Gerrit Lünsdorf 100141
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
procedure Calculator is
  First, Second : Integer;
  --Tmp1, Tmp2 : Float;
begin
  Put ("Enter two integers: ");
  Get (First);
  Get (Second);
  Put ("The sum is");
  Put (First + Second);
  New_Line;
  Put ("The difference is");
  Put (First - Second);
  New_Line;
  Put ("The product is");
  Put (First * Second);
  New_Line;
  Put ("The quotient is");
  --Tmp1 := Float(First);
  --Tmp2 := Float(Second);
  Put (Float(First) / Float(Second));
  New_Line;
end Calculator;
