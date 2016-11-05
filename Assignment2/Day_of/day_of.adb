function Day_Of( Day, Month, Year : in  Integer) return Integer
is
  D : Integer := Day;
  M : Integer := Month;
  Y : Integer := Year;
  C : Integer;
begin
  if M < 3 then
    Y := Y - 1;
    M := M + 10;
  else
    M := M - 2;
  end if;
  C := Y / 100;
  Y := Y mod 100;
  return ((26 * M - 2) / 10 + Day + Y / 4 + C / 4 - 2 * C) mod 7;
end Day_Of;
