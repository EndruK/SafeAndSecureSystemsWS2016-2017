with GNAT.SHA1;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Password_Cracking_Context is
    function Compute_Hash(Password: Password_Type) return Hash_Type is
    begin
        return GNAT.SHA1.Digest(Password);
    end Compute_Hash;
--------------------------------------------------------------------------------
    procedure First(Password: out Password_Type) is
        Result : Password_Type := (others => Alphabet(1));
    begin
        Password := Result;
    end First;
--------------------------------------------------------------------------------
    function  Has_Next(Password: Password_Type) return Boolean is
    begin
        for C in Password'Range loop
            if Password(C) /= Alphabet(Alphabet'Last) then
                return True;
            end if;
        end loop;
        return False;
    end Has_Next;
--------------------------------------------------------------------------------
    procedure Next(Password: in out Password_Type) is
    begin
        if Has_Next(Password) then
            for C in Password'Range loop
                if Get_Character_Index(Password(C)) < 52 then
                    Password(C) := Alphabet(
                        Get_Character_Index(Password(C)) + 1);
                    exit;
                else
                    Password(C) := Alphabet(1);
                end if;
            end loop;
        end if;
    end Next;
--------------------------------------------------------------------------------
    function Get_Character_Index(Char : in Character) return Positive is
    begin
        for C in Alphabet'Range loop
            if Char = Alphabet(C) then
                return C;
            end if;
        end loop;
    end Get_Character_Index;
end Password_Cracking_Context;
