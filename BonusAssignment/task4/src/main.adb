with Ada.Text_IO, Ada.Integer_Text_IO, Hofstadter_Tasks, Armageddon; --Hofstadter, 
use Ada.Text_IO, Ada.Integer_Text_IO, Armageddon;

procedure Main is
	Number_Of_Tasks : constant Positive := 4;
	N : constant Positive := 2_000_000;
	-- TTL : constant Duration := 0.0025;
	TTL : constant Duration := 0.5025; -- enough calculation time for one task

	--package Hofstadter_Package is new Hofstadter (Num_Tasks => 1);
	package Hofstadter_Tasks_Package is new Hofstadter_Tasks (
		N_Tasks => Number_Of_Tasks,
		Target_Value => N);
	--package HP renames Hofstadter_Package;
	package HP_Tasks renames Hofstadter_Tasks_Package;

	-- Task_Q : HP_Tasks.Hofstadter_Task; --TODO: gibt es nicht mehr

begin
	Put_Line("Start Main");
	Put_Line("Setting up values ...");
	-- HP_Tasks.Set_Target_Value(N);
	HP_Tasks.Set_TTL(TTL);
	HP_Tasks.Init;
end Main;
