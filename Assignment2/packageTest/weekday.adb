with Ada.Text_IO, Ada.Integer_Text_IO, Dates;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Weekday is
  Day, Month, Year : Integer;
begin -- Weekday
  Put("Enter a date: ");
  Get(Day);
  Get(Month);
  Get(Year);

  if Dates.Valid(Day, Month, Year) then
    Put(Dates.Day_Of(Day, Month, Year));
  else
    Put_Line("Invalid date!");
  end if;
end Weekday;
