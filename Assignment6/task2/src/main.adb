-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Sorting;
use Sorting;
procedure Main is
    foobar : Natural_Array := (31,2,5,6,10,321,123,1245,4323,4,5741,1,1);
begin -- Main
    Sorting.Selection_Sort(foobar);
end Main;
