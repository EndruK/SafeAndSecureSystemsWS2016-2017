with Ada.Text_IO, Ada.Integer_Text_IO, Hofstadter;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is

	package Hofstadter_Package is new Hofstadter (Num_Tasks => 1);
	package HP renames Hofstadter_Package;

	Q_Number : constant Positive := 2_000_000;

begin
	Put_Line("Start Main");
	-- HP.Call_Compute_Q(Q_Number);
	Put(HP.Compute_Q_Sequence_Sequential(Q_Number));

end Main;
