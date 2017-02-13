with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO;

package body Hofstadter is
    function Compute_Q_Sequence_Sequential(N: Positive) return Positive is
        Q_Numbers: myArray := new QArray(1..N);

    begin
        Q_Numbers(1) := 1;
        Q_Numbers(2) := 1;

        for I in Positive range 3..N loop
            Q_Numbers(I) := Q_Numbers(I - Q_Numbers(I-1))+
                            Q_Numbers(I - Q_Numbers(I-2));
        end loop;

--        for I in Integer range 1..N loop
--            Put(Q_Numbers(I));
--        end loop;

        return Q_Numbers(N);
    end Compute_Q_Sequence_Sequential;

--    procedure Call_Compute_Q(N: Positive) is
--    begin
--        select
--            accept Compute_Q_Sequence_Sequential(N));
--        or
--            delay 5.0;
--            Timed_Quit;
--        end select;
--    end Call_Compute_Q;

--    procedure Timed_Quit is
--    begin
--        Ada.Text_IO.Put_Line("Timelimit reached: Quit.");
--    end Timed_Quit;
end Hofstadter;
