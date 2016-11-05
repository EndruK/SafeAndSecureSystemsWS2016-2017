-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Guess is
  subtype Guess_Range is Integer range 1..1000;
  User_In : Integer;
  Input_Count : Integer := 0;
  package Random_X is new Ada.Numerics.Discrete_Random(Guess_Range);
  use Random_X;
  Gen : Generator;
  Secret : Guess_Range;
begin -- Guess
  Reset(Gen);
  Secret := Random(Gen);
  Put_Line("Guess the number in less than 10 guesses!");
  loop
    if Input_Count >= 10 then
      exit;
    end if;
    Get(User_In);
    if User_In > Secret then
      Put_Line("Your guess was too high!");
      Input_Count := Input_Count + 1;
    elsif User_In < Secret then
      Put_Line("Your guess was too low!");
      Input_Count := Input_Count + 1;
    else
      exit;
    end if;
  end loop;
  if Input_Count >= 10 then
    Put_Line("Sorry, you didn't guess the number :(");
  else
    Put_Line("Yay, you guessed the number :)");
  end if;
end Guess;
