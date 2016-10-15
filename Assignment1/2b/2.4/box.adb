with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Box is
  X,Y,Z : Integer;
begin
  Put("Enter X Y and Z values for your box");
  New_Line;
  Get(X);
  Get(Y);
  Get(Z);
  Put("Surface of Box:");
  Put(((X*Y)*2)+((X*Z)*2)+((Y*Z)*2));
  Put("cm^2");
  New_Line;
  Put("Volume of Box:");
  Put(X*Y*Z);
  Put("cm^3");
end Box;
