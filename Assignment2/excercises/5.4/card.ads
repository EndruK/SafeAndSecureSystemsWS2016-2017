-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;

package Card is
  type Suit is (Clubs,Diamonds,Hearts,Spades);
  type Value is (Ace, Two, Three, Four, Five,
                 Six, Seven, Eight, Nine, Ten,
                 Jack, Queen, King);
  type Card is tagged record
    s : Suit;
    v : Value;
  end record;
  procedure Pick(c : in out Card);
  procedure Print(c : in Card);
  function Equals(Lhs : in Card; Rhs : in Card) return Boolean;
private
  procedure Random_Suit(s : out Suit);
  procedure Random_Value(v : out Value);
end Card;
