with Ada.Integer_Text_IO, Ada.Text_IO, Hofstadter;
use Ada.Integer_Text_IO;

package body Hofstadter_Tasks is
    package Hofstadter_Package is new Hofstadter (Num_Tasks => 1);
    package HP renames Hofstadter_Package;

    task body Hofstadter_Task is
        Given_N : Positive;
    begin
        accept Call_Compute_Q(N : in Positive) do
            Given_N := N;
        end Call_Compute_Q;
    	Put(HP.Compute_Q_Sequence_Sequential(Given_N));
    end Hofstadter_Task;
end Hofstadter_Tasks;
