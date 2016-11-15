-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO, Elections;
use Ada.Text_IO, Elections;
procedure Main is
    package Party_IO is new Ada.Text_IO.Enumeration_IO(Party);
begin -- Main
    Initialize(222222222222222);
    Vote_For(A);
    Vote_For(A);
    Vote_For(B);
    Vote_For(B);
    Vote_For(B);
    Put("Winner is: ");
    Party_IO.Put(Find_Winner);
end Main;
