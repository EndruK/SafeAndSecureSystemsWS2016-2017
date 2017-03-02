generic
    N_Tasks : Positive;
    Target_Value : Positive;
package Hofstadter_Tasks is
    type QArray is array(Positive range <>) of Positive;
    type myArray is access QArray;
    type Status_Array is array(Positive range <>) of aliased Boolean;

    task type Master_Type is
        entry Start;
        entry Shutdown;
        entry Show_Result;
    end Master_Type;

    task type Worker_Type is
        entry Start(Given_Value : in Positive; Worker_Id : in Positive);
        entry Stop;
    end Worker_Type;

    task type Timer_Type is
        entry Start;
    end Timer_Type;

    type Worker_Array_Type is array(Positive range <>) of Worker_Type;
    type Data_Array is array(Positive range <>) of Positive;

    procedure Set_TTL(T : in Duration);
    procedure Init;

    function Compute_Q_Sequence_Sequential(N: Positive) return Positive;
end Hofstadter_Tasks;
