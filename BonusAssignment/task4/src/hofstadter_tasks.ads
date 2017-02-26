generic
package Hofstadter_Tasks is
    task type Master_Type is
        entry Start;
        entry Shutdown;
        entry Show_Result;
    end Master_Type;

    task type Worker_Type is
        entry Master_Start;
        entry Stop;
    end Worker_Type;

    task type Timer_Type is
        entry Start;
    end Timer_Type;

    procedure Set_TTL(T : in Duration);
    procedure Set_Target_Value(N : in Positive);
    procedure Init;

end Hofstadter_Tasks;
