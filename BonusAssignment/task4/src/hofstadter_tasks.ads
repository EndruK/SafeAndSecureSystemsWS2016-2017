generic
    N_Tasks : Positive;
    Target_Value : Positive;
package Hofstadter_Tasks is
    task type Master_Type is
        entry Start;
        entry Shutdown;
        entry Show_Result;
        entry Worker_Needs_Work; --(Worker_Id : in Task_Id);
    end Master_Type;

    task type Worker_Type is
        entry Start(Given_Value : in Positive);
        entry Stop;
    end Worker_Type;

    task type Timer_Type is
        entry Start;
    end Timer_Type;

    type Worker_Array_Type is array(Positive range <>) of Worker_Type;
    type Data_Array is array(Positive range <>) of Positive;

    protected type Result_Protected_Type is
        function Get_Result (At_Index : in Positive) return Positive;
        procedure Set_Result (At_Index : in Positive;
                              Result_Value : in Positive);
    private
        Data : Data_Array(1 .. Target_Value);
    end Result_Protected_Type;

    procedure Set_TTL(T : in Duration);
    --procedure Set_Target_Value(N : in Positive);
    procedure Init;

    function Compute_Q_Sequence_Sequential(N: Positive) return Positive;
end Hofstadter_Tasks;
