-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package body Card is
  procedure Pick(c : in out Card) is
    s : Suit;
    v : Value;
  begin -- Pick
    Random_Suit(s);
    Random_Value(v);
    c.s := s;
    c.v := v;
  end Pick;

  procedure Random_Suit(s : out Suit) is
    package Random_X is new Ada.Numerics.Discrete_Random(Suit);
    use Random_X;
    Gen : Generator;
  begin -- Random_Suit
    Reset(Gen);
    s := Random(Gen);
  end Random_Suit;

  procedure Random_Value(v : out Value) is
    package Random_X is new Ada.Numerics.Discrete_Random(Value);
    use Random_X;
    Gen : Generator;
  begin -- Random_Value
    Reset(Gen);
    v := Random(Gen);
  end Random_Value;

  procedure Print(c : in Card) is
    package Suit_IO is new Enumeration_IO(Suit);
    package Value_IO is new Enumeration_IO(Value);
  begin -- Print
    Suit_IO.Put(c.s);
    Put("-");
    Value_IO.Put(c.v);
    New_Line;
  end Print;
end Card;
