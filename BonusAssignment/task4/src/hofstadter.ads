generic
    Num_Tasks: Positive;
package Hofstadter is
    type myArray is array(Positive range <>) of Positive;

    function Compute_Q_Sequence_Sequential(N: Positive) return Positive;

--    procedure Call_Compute_Q(N : Positive);
--    procedure Timed_Quit;
end Hofstadter;
