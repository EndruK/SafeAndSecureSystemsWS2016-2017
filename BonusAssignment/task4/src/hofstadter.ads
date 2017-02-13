generic
    Num_Tasks: Positive;
package Hofstadter is
    type QArray is array(Positive range <>) of Positive;
    type myArray is access QArray;

    function Compute_Q_Sequence_Sequential(N: Positive) return Positive;

--    procedure Call_Compute_Q(N : Positive);
--    procedure Timed_Quit;
end Hofstadter;
