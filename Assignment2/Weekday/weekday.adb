with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Weekday is
  Day     : Integer;
  Month   : Integer;
  Year    : Integer;
  Century : Integer;
begin -- Weekday
  Put("Enter a date: ");
  Get(Day);
  Get(Month);
  Get(Year);
  if Month < 3 then
    Year  := Year - 1;
    Month := Month + 10;
  else
    Month := Month - 2;
  end if;
  Century := Year / 100;
  Year    := Year mod 100;
  Put(((26 * Month - 2) / 10 + Day + Year + Year / 4 + Century / 4 - 2 * Century) mod 7);
end Weekday;
