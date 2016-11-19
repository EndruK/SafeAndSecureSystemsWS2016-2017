-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Thread; -- Ada.Text_IO,
use Thread; -- Ada.Text_IO,
procedure Main is
    My_State : State := None;
begin -- Main
    Initialize(My_State);
    for P in Action'First .. Action'Last loop
        Do_Action(My_State, P);
    end loop;
end Main;
