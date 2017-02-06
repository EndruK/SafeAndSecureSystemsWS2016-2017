generic
    Num_Colliding_Bits: Natural;
    Num_State_Bits:     Natural; -- 160 for SHA-1
    Num_Tasks:          Natural;
package Brent_Context is
    NUM_BITS_PER_CHAR:  constant Natural := 4;
    NUM_STATE_CHARS:    constant Natural := Num_State_Bits / NUM_BITS_PER_CHAR; 
    
    subtype Hash_Type is String(1 .. NUM_STATE_CHARS);

    type Point_Type is record
        Preimage: Hash_Type;
        Hash:     Hash_Type;
    end record;
    
    function "="(Left: Point_Type; Right: Point_Type) return Boolean;
    function "<"(Left: Point_Type; Right: Point_Type) return Boolean;
    function Compute_Hash(Input: Hash_Type) return Hash_Type;
end Brent_Context;