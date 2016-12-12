-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Thread;
use Thread;
procedure Main is
    -- My_State : State := None;
begin -- Main
    Initialize;
    for P in Action'First .. Action'Last loop
        Do_Action(P);
    end loop;
--    exception
--        when Illegal_Transition => null;
end Main;
