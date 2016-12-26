-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

with Sorting; use Sorting;
package Sorting.Helper is
    subtype A is Natural_Array; -- is array(Natural range <>) of Natural;
    subtype Old_Min is Natural;
    subtype New_Min is Natural;

    procedure Swap(A: in out Natural_Array; Old_Min : in Natural; New_Min : in Natural) with
        Pre => (Old_Min in A)
            and (New_Min in A),
        Post => (New_Min <= Old_Min)
            and ((New_Min = New_Min'Old)
                or (New_Min = Old_Min'Old)
                or (Old_Min = Old_Min'Old)
                or (Old_Min = New_Min'Old))
            and (New_Min in A)
            and (Old_Min in A);

end Helper;
