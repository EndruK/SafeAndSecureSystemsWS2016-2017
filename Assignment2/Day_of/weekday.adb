with Ada.Text_IO, Ada.Integer_Text_IO, Day_Of;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Weekday is
  Day, Month, Year : Integer;
begin -- Weekday
  Put("Enter a date: ");
  Get(Day);
  Get(Month);
  Get(Year);
  Put(Day_Of(Day,Month,Year));
end Weekday;
