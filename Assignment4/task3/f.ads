-- André Karge 110033
-- K. Gerrit Lünsdorf 100141

-- F(N) calculates N!
function F(N: Natural) return Natural with
    Pre =>  N >= 0 and N <= Natural'Last,
    Post => X >= 1 and X <= Natural'Last
is
    I: Natural := 0; -- def(I)
    X: Natural := 1; -- def(X)
begin --def(N)
    while I < N loop -- p-use(N), p-use(I)
        I := I + 1; -- c-use(I), def(I)
        X := X * I; -- c-use(X), c-use(I), def(X)
    end loop;

    return X; -- c-use(X)
end F;
