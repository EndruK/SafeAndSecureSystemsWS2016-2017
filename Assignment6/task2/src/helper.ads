-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

package Helper is
    type Natural_Array is array(Natural range <>) of Natural;

    procedure Swap(A: in out Natural_Array, Old_Min, New_Min: in Integer);
end Helper;
