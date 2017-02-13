generic
    Num_Password_Chars: Positive;
    Num_Tasks: Positive;
package Password_Cracking_Context is
    subtype Hash_Type is String(1 .. 40);
    subtype Password_Type is String(1 .. Num_Password_Chars);

    type Hash_Array_Type is array(Natural range <>) of Hash_Type;
    type Password_Array_Type is array(Natural range <>) of Password_Type;

    function  Compute_Hash(Password: Password_Type) return Hash_Type;
    procedure First(Password: out Password_Type);
    function  Has_Next(Password: Password_Type) return Boolean;
    procedure Next(Password: in out Password_Type);
private
    Character_String : String :=
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    function Get_Character_Index(Char : in Character) return Positive;
end Password_Cracking_Context;
