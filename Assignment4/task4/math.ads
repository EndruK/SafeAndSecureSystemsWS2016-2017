-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package body Math is
--    type Integer is range -(2 ** 31) .. +(2 ** 31 - 1);
--    subtype Natural  is Integer range 0 .. +(2 ** 31 - 1);
--    Integer'Size = 32
--    Natural'Size = 31
--    Unsigned is mod 2**(Integer'Size) -> bitwise representation
--    no bit lost via casting from Natural to Unsigned

    type Unsigned is mod 2**(Integer'Size);

    Procedure S(X: in out Natural; Y: in out Natural) with
        Pre => X >= 0
            and Y >= 0
            and X <= Natural'Last
            and Y <= Natural'Last,
        Post => X = Y'Old and Y = X'Old
            and (  (X = X'Old and Y = Y'Old)
                or (X = Y'Old and Y = X'Old)
            ) is
    begin -- def(X, Y)
        X := Natural(Unsigned(X) xor Unsigned(Y)); -- def(X); c-use(X, Y)
        Y := Natural(Unsigned(X) xor Unsigned(Y)); -- def(Y); c-use(X, Y)
        X := Natural(Unsigned(X) xor Unsigned(Y)); -- def(X); c-use(X, Y)
    end S;

    Procedure T(X: in out Natural; Y: in out Natural; Z: in out Natural) with
        Pre => X, Y, Z >= 0 and X, Y, Z <= Natural'Last
        Post => X <= Y <= Z
            and (  (X = X'Old and Y = Y'Old and Z = Z'Old)
                or (X = X'Old and Z = Y'Old and Y = Z'Old)
                or (Y = X'Old and X = Y'Old and Z = Z'Old)
                or (Y = X'Old and Z = Y'Old and X = Z'Old)
                or (Z = X'Old and X = Y'Old and Y = Z'Old)
                or (Z = X'Old and Y = Y'Old and X = Z'Old)
            ) is
    begin -- def (X, Y, Z)
        if X > Y then -- p-use(X, Y)
            S(X, Y); -- def(X, Y); c-use(X, Y)
        end if;

        if Y > Z then -- p-use(Y, Z)
            S(Y, Z); -- def(Y, Z); c-use(Y, Z)
        end if;

        if X > Y then -- p-use(X, Y)
            S(X, Y); -- def(X, Y); c-use(X, Y)
        end if;
    end T;
end package;
