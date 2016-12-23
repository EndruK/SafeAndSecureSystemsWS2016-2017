-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Sorting;
use Sorting;
procedure Main is
    foobar : Natural_Array := (3, 1);
begin -- Main
    Sorting.Selection_Sort(foobar);
end Main;
