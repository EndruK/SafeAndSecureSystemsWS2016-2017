function G(N: Natural; K: Natural) return Natural with
    Pre =>  N >= 0 and N <= Natural'Last
        and K >= 0 and K <= Natural'Last,
    Post => Result >= 0 and Result <= Natural'Last
is
    X: Natural;
    Y: Natural;
    Z: Natural;
begin -- def(X, Y, Z, N, K)
    X := F(K); -- def (X), c-use(K)
    Y := F(N-K); -- def (Y), c-use(N-K)
    Z := F(N); -- def (Z), c-use(N)
    return Z / (X * Y); -- c-use(X, Y, Z)
end G;
