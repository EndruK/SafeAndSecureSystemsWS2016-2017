-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random, Card;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Card_Game is
  Card1 : Card.Card;
  Card2 : Card.Card;
  Card3 : Card.Card;
begin -- Card_Game
  Card.Pick(Card1);
  Card.Pick(Card2);
  Card.Pick(Card3);
  loop
    if Card.Equals(Card1, Card2) or else
        Card.Equals(Card2, Card3) or else
        Card.Equals(Card1, Card3) then
      Card.Pick(Card1);
      Card.Pick(Card2);
      Card.Pick(Card3);
    else
      exit;
    end if;
  end loop;
  Card.Print(Card1);
  Card.Print(Card2);
  Card.Print(Card3);
end Card_Game;
