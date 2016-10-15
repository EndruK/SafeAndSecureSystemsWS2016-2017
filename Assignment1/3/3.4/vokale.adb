with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure Vokale is
  A,E,I,O,U : Integer := 0;
  User_Input : Character;
begin
  Input_Loop:
  loop
    Get(User_Input);
    case User_Input is
      when 'A' | 'a' =>
        A := A + 1;
      when 'E' | 'e' =>
        E := E + 1;
      when 'I' | 'i' =>
        I := I + 1;
      when 'O' | 'o' =>
        O := O + 1;
      when 'U' | 'u' =>
        U := U + 1;
      when others =>
        null;
    end case;
    exit Input_Loop when User_Input = '.';
  end loop Input_Loop;
  New_Line;
  Put("Written A's: ");
  Put(A);
  New_Line;
  Put("Written E's: ");
  Put(E);
  New_Line;
  Put("Written I's: ");
  Put(I);
  New_Line;
  Put("Written O's: ");
  Put(O);
  New_Line;
  Put("Written U's: ");
  Put(U);
  New_Line;
  Put("All vowels in total: ");
  Put(A+E+I+O+U);
end Vokale;
