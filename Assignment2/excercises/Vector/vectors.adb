package body Vectors is
    -- Adds two vectors dimension-wise.
    function "+"(Left: Vector; Right: Vector) return Vector is
        Result : Vector;
    begin
        Result.X = Left.X + Right.X;
        Result.Y = Left.Y + Right.Y;
        Result.Z = Left.Z + Right.Z;
        return Result;
    end "+";

    -- Subtracts the right vector from the left one dimension-wise.
    function "-"(Left: Vector; Right: Vector) return Vector is
        Result : Vector;
    begin

    end "-";
    -- Multiplies all dimensions of Left by Right.
    function "*"(Left: Vector; Right: Float) return Vector is
    begin
    end "*";
    -- Computes the scalar product.
    function "*"(Left: Vector; Right: Vector) return Float is
    begin
    end "*";
    -- Returns True if all dimensions of Left are equal to that of Right;
    -- Returns False otherwise.
    function "="(Left: Vector; Right: Vector) return Boolean is
    begin
    end "=";
    -- Determines if both vectors stand orthogonal to each other or not.
    function Are_Orthogonal(Left: Vector; Right: Vector) return Boolean is
    begin
    end Are_Orthogonal;
    -- Computes the cross product.
    function Cross_Product(Left: Vector; Right: Vector) return Vector is
    begin
    end Cross_Product;
    -- Computes the distance between both vectors.
    function Distance(Left: Vector; Right: Vector) return Float is
    begin
    end Distance;
    -- Computes the distance to the origin of the coordinate system.
    function Distance_To_Origin(Item: Vector) return Float is
    begin
    end Distance_To_Origin;
    procedure Put(Item: Vector) is
    begin
    end Put;
end Vectors;
