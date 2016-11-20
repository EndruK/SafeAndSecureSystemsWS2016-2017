-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Thread;
use Thread;
procedure Main is
    My_State : State := None;
begin -- Main
    Initialize(My_State);
    for P in Action'First .. Action'Last loop
        Do_Action(My_State, P);
    end loop;
    exception
        when Illegal_Transition => null;

end Main;
