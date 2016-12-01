-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package body Math is
--    type Integer is range -(2 ** 31) .. +(2 ** 31 - 1);
--    subtype Natural  is Integer range 0 .. +(2 ** 31 - 1);
--    Integer'Size = 32
--    Unsigned is mod 2**(Integer'Size) -> bitwise representation
--    no bit lost via casting from Natural to Unsigned

    type Unsigned is mod 2**(Integer'Size);

    -- precondition(implicit) := X, Y >= 0 and X, Y <= Natural'Last
    -- postcondition := X = Y'Old and Y = X'Old and (X, Y) is Permutation(X'Old, Y'Old)
    Procedure S(X: in out Natural; Y: in out Natural) is
    -- X and Y are Natural -> 2**31 - 1
    begin -- def(X, Y);
        X := Natural(Unsigned(X) xor Unsigned(Y)); -- c-use(X, Y); def(X);
        Y := Natural(Unsigned(X) xor Unsigned(Y)); -- c-use(X, Y); def(Y);
        X := Natural(Unsigned(X) xor Unsigned(Y)); -- c-use(X, Y); def(X);

    -- Rule: Assignment and Composition
    -- [X = X'Old and Y = Y'Old]           X := X xor Y; [X = X'Old xor Y'Old and Y = Y'Old] -- Assignment
    -- [X = X'Old xor Y'Old and Y = Y'Old] Y := X xor Y; [X = X'Old xor Y'Old and Y = X'Old] -- Assignment
    -- [X = X'Old xor Y'Old and Y = X'Old] X := X xor Y; [X = Y'Old and Y = X'Old] -- Assignment
    -- [X = X'Old and Y = Y'Old] S; [X = Y'Old and Y = X'Old]
    end S;





    -- precondition(implicit) := X, Y, Z >= 0 and X, Y, Z <= Natural'Last
    -- postcondition := (X <= Y <= Z) and (X, Y, Z) is Permutation(X'Old, Y'Old, Z'Old)

    Procedure T(X: in out Natural; Y: in out Natural; Z: in out Natural) is
    begin -- def (X, Y, Z);

        -- Define Permutation := (X, Y, Z) is Permutation(X'Old, Y'Old, Z'Old)
        -- Given: X < Y ==> X <= Y

        precondition: [Permutation] -- Rules: IF-THEN-ELSE, Assignment, Empty Statement, Conclusion
        [not C1 and Permutation] null; [X <= Y and Permutation]
        [C1 and Permutation] S; [X <= Y and Permutation]
        postcondition: [X <= Y and Permutation]

IF-THEN-ELSE{
    precondition: [Permutation]
        [not C1] null; [X <= Y]{
            Conclusion and Empty Statement
        }
        [C1] S; [X <= Y]{
            Assignment and Conclusion
        }
    postcondition: [X <= Y and Permutation]
}

        if X > Y then -- p-use(X, Y)
            S(X, Y); -- c-use(X, Y); def(X, Y)
        end if;

        precondition: [X <= Y and Permutation] -- Rules: IF-THEN-ELSE, Assignment, Empty Statement, Conclusion
        [not C2 and X <= Y and Permutation] null; [X <= Z and Y <= Z and Permutation] -- {P'}S{Q'} (Empty Statement)
            [not C2 and X <= Y and Permutation] ==> [X <= Z and Y <= Z and Permutation] -- P ==> P', see Conclusion
                [Y <= Z and X <= Y and Permutation] ==> [X <= Z and Y <= Z and Permutation]
        [C2 and X <= Y and Permutation] S; [X <= Z and Y <= Z and Permutation] -- need a Conclusion
            [Y > Z and X <= Y and Permutation] S(Y, Z); [X <= Z and Y <= Z and Permutation] -- need a Conclusion
            P = P' := Y > Z and X <= Y and Permutation
                Q' := Z > Y and X <= Z and Permutation  -- Assignment: {P'}S;{Q'} -> Conclusion {P}S;{Q}
                Q := X <= Z and Y <= Z and Permutation
        postcondition: [X <= Z and Y <= Z and Permutation]

IF-THEN-ELSE{
    precondition: [X <= Y and Permutation]
        [X <= Y and not C1 and Permutation] null; [X <= Y and Y <= Z and Permutation]{
            Conclusion and Empty Statement
        }
        [X <= Y and C1 and Permutation] S; [X <= Y and Y <= Z and Permutation]{
            Assignment and Conclusion
        }
    postcondition: [X <= Y and Y <= Z and Permutation]
}
        if Y > Z then -- p-use(Y, Z)
            S(Y, Z); -- c-use(Y, Z); def(Y, Z)
        end if;

        precondition: [X <= Z and Y <= Z and Permutation] -- Rules: IF-THEN-ELSE, Assignment, Empty Statement, Conclusion
        [not C3 and X <= Z and Y <= Z and Permutation] null; [X <= Y and Y <= Z and X <= Z and Permutation]
        [C3 and X <= Z and Y <= Z and Permutation] S; [X <= Y and Y <= Z and X <= Z and Permutation]
        postcondition: [ X <= Y and Y <= Z and Permutation]

        if X > Y then -- p-use(X, Y)
            S(X, Y); -- c-use(X, Y); def(X, Y)
        end if;
    end T;
end package;
