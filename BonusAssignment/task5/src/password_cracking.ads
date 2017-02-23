with Password_Cracking_Context;

generic
    with package Context is new Password_Cracking_Context(<>);
package Password_Cracking is
    use Context;
    procedure Find_Passwords(Hashes:    Hash_Array_Type;
                             Passwords: out Password_Array_Type;
                             Success:   out Boolean);
end Password_Cracking;
