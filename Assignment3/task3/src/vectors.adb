-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Numerics.Elementary_Functions;
with Ada.Float_Text_IO;
with Ada.Text_IO;

package body Vectors is

    function "+"(Left: Vector; Right: Vector) return Vector is
    begin
        return Vector'(Left.X + Right.X, Left.Y + Right.Y, Left.Z + Right.Z);
    end "+";

--------------------------------------------------------------------------------

    function "-"(Left: Vector; Right: Vector) return Vector is
    begin
        return Vector'(Left.X - Right.X, Left.Y - Right.Y, Left.Z - Right.Z);
    end "-";

--------------------------------------------------------------------------------

    function "*"(Left: Vector; Right: Float) return Vector is
    begin
        return Vector'(Left.X * Right, Left.Y * Right, Left.Z * Right);
    end "*";

--------------------------------------------------------------------------------

    function "*"(Left: Vector; Right: Vector) return Float is
    begin
        return (Left.X * Right.X) + (Left.Y * Right.Y) + (Left.Z * Right.Z);
    end "*";

--------------------------------------------------------------------------------

    function "="(Left: Vector; Right: Vector) return Boolean is
    begin
        return (Left.X = Right.X)
            and then (Left.Y = Right.Y)
            and then (Left.Z = Right.Z);
    end "=";

--------------------------------------------------------------------------------

    function Are_Orthogonal(Left: Vector; Right: Vector) return Boolean is
        Epsilon: constant Float := 0.00001;
    begin
        return ((Left * Right) ** 2) < (Epsilon ** 2);
    end Are_Orthogonal;

--------------------------------------------------------------------------------

    function Cross_Product(Left: Vector; Right: Vector) return Vector is
    begin
        return Vector'(
            Left.Y * Right.Z - Left.Z * Right.Y,
            Left.Z * Right.X - Left.X * Right.Z,
            Left.X * Right.Y - Left.Y * Right.X
        );
    end Cross_Product;

--------------------------------------------------------------------------------

    function Distance(Left: Vector; Right: Vector) return Float is
    begin
        return Distance_To_Origin(Left - Right);
    end Distance;

--------------------------------------------------------------------------------

    function Distance_To_Origin(Item: Vector) return Float is
        use Ada.Numerics.Elementary_Functions;
    begin
        return Sqrt(Item.X**2 + Item.Y**2 + Item.Z**2);
    end Distance_To_Origin;

--------------------------------------------------------------------------------

    procedure Put(Item: Vector) is
        Aft: constant Natural  := Ada.Float_Text_IO.Default_Aft;
        Exp: constant Natural  := 0;
        Fore: constant Natural := 0;
    begin
        Ada.Text_IO.Put("(");
        Ada.Float_Text_IO.Put(Item => Item.X, Aft => Aft, Exp => Exp, Fore => Fore);
        Ada.Text_IO.Put(", ");
        Ada.Float_Text_IO.Put(Item => Item.Y, Aft => Aft, Exp => Exp, Fore => Fore);
        Ada.Text_IO.Put(", ");
        Ada.Float_Text_IO.Put(Item => Item.Z, Aft => Aft, Exp => Exp, Fore => Fore);
        Ada.Text_IO.Put(")");
    end Put;

end Vectors;
