with Ada.Text_IO, Ada.Integer_Text_IO, Hofstadter, Hofstadter_Tasks, Armageddon;
use Ada.Text_IO, Ada.Integer_Text_IO, Armageddon;

procedure Main is

	package Hofstadter_Package is new Hofstadter (Num_Tasks => 1);
	package Hofstadter_Tasks_Package is new Hofstadter_Tasks;
	package HP renames Hofstadter_Package;
	package HP_Tasks renames Hofstadter_Tasks_Package;

	Q_Number : constant Positive := 1_000_000;
	Timelimit : constant Duration := 0.0025;
	Task_Q : HP_Tasks.Hofstadter_Task;

begin
	Put_Line("Start Main");
	select
		Task_Q.Call_Compute_Q(Q_Number);
		Put_Line("Start HP_Task");
	or
		delay Timelimit;
		Put_Line("Took to long: Quit.");
	end select;
    -- Put(HP.Compute_Q_Sequence_Sequential(Q_Number));

end Main;
