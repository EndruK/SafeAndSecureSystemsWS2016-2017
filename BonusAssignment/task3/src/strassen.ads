generic
    Num_Tasks: Positive;
    type Item_Type is mod <>;
package Strassen is
    type Matrix_Type is array(Natural range <>, Natural range <>) of Item_Type;
    Invalid_Size_Exception: exception;

    function Multiply(A: Matrix_Type; B: Matrix_Type) return Matrix_Type;
    -- Returns the result of multiplying both given (n * n)-elements matrices.
    -- Raises an Invalid_Size_Exception if A and B differ in size.
end Strassen;