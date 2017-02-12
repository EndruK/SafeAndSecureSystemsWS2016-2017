package body Password_Cracking_Context is
    function Compute_Hash(Password: Password_Type) return Hash_Type is
        Result : Hash_Type;
    begin
        return Result;
    end Compute_Hash;
--------------------------------------------------------------------------------
    procedure First(Password: out Password_Type) is
    begin
        Null;
    end First;
--------------------------------------------------------------------------------
    function  Has_Next(Password: Password_Type) return Boolean is
        Result : Boolean := False;
    begin
        return Result;
    end Has_Next;
--------------------------------------------------------------------------------
    procedure Next(Password: in out Password_Type) is
    begin
        Null;
    end Next;
end Password_Cracking_Context;
