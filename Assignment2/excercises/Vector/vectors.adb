-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package body Vectors is
    -- Adds two vectors dimension-wise.
    function "+"(Left: Vector; Right: Vector) return Vector is
        Result : Vector;
    begin
        Result.X := Left.X + Right.X;
        Result.Y := Left.Y + Right.Y;
        Result.Z := Left.Z + Right.Z;
        return Result;
    end "+";

    -- Subtracts the right vector from the left one dimension-wise.
    function "-"(Left: Vector; Right: Vector) return Vector is
        Result : Vector;
    begin
        Result.X := Left.X - Right.X;
        Result.Y := Left.Y - Right.Y;
        Result.Z := Left.Z - Right.Z;
        return Result;
    end "-";
    -- Multiplies all dimensions of Left by Right.
    function "*"(Left: Vector; Right: Float) return Vector is
        Result : Vector;
    begin
        Result.X := Left.X * Right;
        Result.Y := Left.Y * Right;
        Result.Z := Left.Z * Right;
        return Result;
    end "*";
    -- Computes the scalar product.
    function "*"(Left: Vector; Right: Vector) return Float is
    begin
        return Left.X * Right.X + Left.Y * Right.Y + Left.Z * Right.Z;
    end "*";
    -- Returns True if all dimensions of Left are equal to that of Right;
    -- Returns False otherwise.
    function "="(Left: Vector; Right: Vector) return Boolean is
    begin
        return Left.X = Right.X and Left.Y = Right.Y and Left.Z = Right.Z;
    end "=";
    -- Determines if both vectors stand orthogonal to each other or not.
    function Are_Orthogonal(Left: Vector; Right: Vector) return Boolean is
    begin
        return Left * Right = 0.0;
    end Are_Orthogonal;
    -- Computes the cross product.
    function Cross_Product(Left: Vector; Right: Vector) return Vector is
        Result : Vector;
    begin
        Result.X := Left.Y * Right.Z - Right.Y * Left.Z;
        Result.Y := Left.Z * Right.X - Right.Z * Left.X;
        Result.Z := Left.X * Right.Y - Right.X * Left.Y;
        return Result;
    end Cross_Product;
    -- Computes the distance between both vectors.
    function Distance(Left: Vector; Right: Vector) return Float is
    begin
        return Sqrt(
            (Left.X - Right.X) ** 2 +
            (Left.Y - Right.Y) ** 2 +
            (Left.Z - Right.Z) ** 2 );
    end Distance;
    -- Computes the distance to the origin of the coordinate system.
    function Distance_To_Origin(Item: Vector) return Float is
    begin
        return Sqrt(Item.X ** 2 + Item.Y ** 2 + Item.Z ** 2);
    end Distance_To_Origin;
    procedure Put(Item: Vector) is
    begin
        -- Put("(" & Item.X & "," & Item.Y & "," & Item.Z & ")");
        Put("(");
        Put(Item.X, Exp=>0);
        Put(",");
        Put(Item.Y, Exp=>0);
        Put(",");
        Put(Item.Z, Exp=>0);
        Put(")");
        New_Line;
    end Put;
end Vectors;
