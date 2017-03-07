with Password_Cracking_Context;

generic
    with package Context is new Password_Cracking_Context(<>);
    Max_Time : Positive;
package Password_Cracking is
    use Context;
    procedure Find_Passwords(Hashes:    Hash_Array_Type;
                             Passwords: out Password_Array_Type;
                             Success:   out Boolean);
private
    protected type Collector is
        -- procedure Set_Password(Index : in Natural; Password : in Password_Type);
        procedure Set_User_Interrupt;
        procedure Set_Timeout_Interrupt;
        function Get_User_Interrupt return Boolean;
        function Get_Timeout_Interrupt return Boolean;
        -- function Check_Done_All return Boolean;
    private
        User_Interrupt : Boolean := False;
        Timeout_Interrupt : Boolean := False;
    end Collector;
end Password_Cracking;
