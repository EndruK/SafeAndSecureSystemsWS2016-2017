-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
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
        procedure Set_User_Interrupt;
        procedure Set_Timeout_Interrupt;
        function Get_User_Interrupt return Boolean;
        function Get_Timeout_Interrupt return Boolean;
    private
        User_Interrupt : Boolean := False;
        Timeout_Interrupt : Boolean := False;
    end Collector;
end Password_Cracking;
