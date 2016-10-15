with Ada.Text_IO;
procedure Test is
begin
  Ada.Text_IO.Put_Line("1st_loop");
  for I in 1 .. 3 loop
    Ada.Text_IO.Put(Integer'Image(I));
  end loop;

  Ada.Text_IO.Put_Line("2nd_loop");
  for I in 3 .. 1 loop
    Ada.Text_IO.Put(Integer'Image(I));
  end loop;

  Ada.Text_IO.Put_Line("3rd_loop");
  for I in reverse 1 .. 3 loop
    Ada.Text_IO.Put(Integer'Image(I));
  end loop;

  Ada.Text_IO.Put_Line("4th_loop");
  for I in reverse 3 .. 1 loop
    Ada.Text_IO.Put(Integer'Image(I));
  end loop;
end Test;
