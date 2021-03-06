--------------------------------------------------------------------------------
--
--  Program: Card_Game
--  Purpose: Display three different cards
--  Author: André Karge (andre.karge@uni-weimar.de) 110033
--          K. Gerrit Lünsdorf (kai.gerrit.luensdorf@uni-weimar.de) 100141
--
--------------------------------------------------------------------------------
with Card;
use Card;
procedure Card_Game is
  Card1 : Card.Card;
  Card2 : Card.Card;
  Card3 : Card.Card;
begin -- Card_Game
  Card.Pick(Card1);
  Card.Pick(Card2);
  Card.Pick(Card3);
  loop
    if Card1 = Card2 or else Card1 = Card3 or else Card2 = Card3 then
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
