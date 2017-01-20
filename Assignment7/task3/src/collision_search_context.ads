generic
    Num_Colliding_Bits: Natural;
    Num_DP_Bits:        Natural;
    Num_State_Bits:     Natural; -- 160 for SHA-1
    Num_Tasks:          Natural;
package Collision_Search_Context is
    NUM_BITS_PER_CHAR:  constant Natural := 4;
    NUM_STATE_CHARS:    constant Natural := Num_State_Bits / NUM_BITS_PER_CHAR; 
    
    subtype Hash_Type is String(1 .. NUM_STATE_CHARS);

    type Distinguished_Point_Type is record
        Preimage: Hash_Type;
        Hash:     Hash_Type;
        -- ... 
    end record;
    
    function "="(Left:  Distinguished_Point_Type; 
                 Right: Distinguished_Point_Type) return Boolean;
    function "<"(Left:  Distinguished_Point_Type; 
                 Right: Distinguished_Point_Type) return Boolean;
    function Compute_Hash(Input: Hash_Type) return Hash_Type;
    function Is_Distinguished_Point(Input: Hash_Type) return Boolean;
end Collision_Search_Context;