-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO, Hofstadter_Tasks, Ada.Command_line, Armageddon;
use Ada.Text_IO, Ada.Command_line, Armageddon;

procedure Main is
    N : Positive := Positive'Value(Argument(1));
    Number_Of_Tasks : Positive := Positive'Value(Argument(2));
    TTL : Duration := Duration'Value(Argument(3));

	package Hofstadter_Tasks_Package is new Hofstadter_Tasks (
		N_Tasks => Number_Of_Tasks,
		Target_Value => N);
	package HP_Tasks renames Hofstadter_Tasks_Package;

begin
	Put_Line("./<program_name> <length> <num_tasks> <time>");
	Put_Line("Setting up values ...");
	HP_Tasks.Set_TTL(TTL);
	HP_Tasks.Init;
end Main;
