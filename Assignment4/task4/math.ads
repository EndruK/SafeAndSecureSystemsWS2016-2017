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
    -- postcondition := X = Y'Old and Y = X'Old
    Procedure S(X: in out Natural; Y: in out Natural) is
    -- X and Y are Natural -> 2**31 - 1
    begin -- def(X, Y);
        X := Natural(Unsigned(X) xor Unsigned(Y)); -- c-use(X, Y); def(X); Rule: Assignment
        Y := Natural(Unsigned(X) xor Unsigned(Y)); -- c-use(X, Y); def(Y); Rule: Assignment and Composition
        X := Natural(Unsigned(X) xor Unsigned(Y)); -- c-use(X, Y); def(X); Rule: Assignment and Composition

    --  precondition(implicit): X, Y >= 0 and X, Y <= Natural'Last (given through subtype Natural)
    --  to proof: X = Y'Old and Y = X'Old

    -- [X = X'Old, Y = Y'Old]              X := X xor Y; [X = X'Old xor Y'Old and Y = Y'Old]
    -- [X = X'Old xor Y'Old and Y = Y'Old] Y := X xor Y; [X = X'Old xor Y'Old and Y = X'Old]
    -- [X = X'Old xor Y'Old and Y = X'Old] X := X xor Y; [X = Y'Old and Y = X'Old]
    -- [X = X'Old, Y = Y'Old] S; [X = Y'Old and Y = X'Old]
    -- proofed: X = Y'Old and Y = X'Old
    end S;

    -- precondition(implicit) := X, Y, Z >= 0 and X, Y, Z <= Natural'Last
    -- postcondition := (X <= Y <= Z)
    --    and(
    --           (X = X'Old and Y = Y'Old and Z = Z'Old)
    --        or (X = X'Old and Z = Y'Old and Y = Z'Old)
    --        or (Y = X'Old and X = Y'Old and Z = Z'Old)
    --        or (Y = X'Old and Z = Y'Old and X = Z'Old)
    --        or (Z = X'Old and X = Y'Old and Y = Z'Old)
    --        or (Z = X'Old and Y = Y'Old and X = Z'Old)
    --    )

    Procedure T(X: in out Natural; Y: in out Natural; Z: in out Natural) is
    begin -- def (X, Y, Z);

        Given: X < Y ==> X <= Y

        precondition: [] -- Rules: IF-THEN-ELSE, Assignment, Empty Statement
        [not C1] null; [X <= Y]
        [C1] S; [X <= Y]
        postcondition: [X <= Y]

        if X > Y then -- p-use(X, Y)
            S(X, Y); -- c-use(X, Y); def(X, Y)
        end if;

        precondition: [X <= Y] -- Rules: IF-THEN-ELSE, Assignment, Composition, Empty Statement
        [not C2 and X <= Y] null; [X <= Z and Y <= Z]
            [not C2 and X <= Y] ==> [X <= Z and Y <= Z]
                [Y <= Z and X <= Y] ==> [X <= Z and Y <= Z]
        [C2 and X <= Y] S; [X <= Z and Y <= Z]
        postcondition: [X <= Z and Y <= Z]

        if Y > Z then -- p-use(Y, Z)
            S(Y, Z); -- c-use(Y, Z); def(Y, Z)
        end if;

        precondition: [X <= Z and Y <= Z] -- Rules: IF-THEN-ELSE, Assignment, Composition, Empty Statement
        [not C3 and X <= Z and Y <= Z] null; [X <= Y and Y <= Z and X <= Z]
        [C3 and X <= Z and Y <= Z] S; [X <= Y and Y <= Z and X <= Z]
        postcondition: [ X <= Y and Y <= Z]

        if X > Y then -- p-use(X, Y)
            S(X, Y); -- c-use(X, Y); def(X, Y)
        end if;
    end T;
end package;
