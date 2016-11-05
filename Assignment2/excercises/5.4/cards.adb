-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Cards is
  type Suit is (Clubs, Diamonds, Hearts, Spades);
  type Value is (Ace, Two, Three, Four, Five,
                 Six, Seven, Eight, Nine, Ten,
                 Jack, Queen, King);
  package Suit_IO is new Enumeration_IO(Suit);
  package Value_IO is new Enumeration_IO(Value);
  package Random_Suit is new Ada.Numerics.Discrete_Random(Suit);
  package Random_Value is new Ada.Numerics.Discrete_Random(Value);
  Gen_Suit : Random_Suit.Generator;
  Gen_Value : Random_Value.Generator;
  Suit1 : Suit;
  Suit2 : Suit;
  Suit3 : Suit;
  Value1 : Value;
  Value2 : Value;
  Value3 : Value;
begin -- Cards
  Random_Suit.Reset(Gen_Suit);
  Random_Value.Reset(Gen_Value);
  Suit1 := Random_Suit.Random(Gen_Suit);
  Value1 := Random_Value.Random(Gen_Value);
  Suit2 := Suit1;
  Suit3 := Suit1;
end Cards;
