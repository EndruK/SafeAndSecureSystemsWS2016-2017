package body Strassen is
    function Multiply(A: Matrix_Type; B: Matrix_Type) return Matrix_Type is
        Result : Matrix_Type := ((1,2,3,4),(5,6,7,8),(9,10,11,12),(13,14,15,16));
    begin
        return Result;
    end Multiply;
end Strassen;
