function G(N: Natural; K: Natural) return Natural is
    X: Natural;
    Y: Natural;
    Z: Natural;
begin -- def(X, Y, Z, N, K)
    X := F(K); -- def (X), c-use(K)
    Y := F(N-K); -- def (Y), c-use(N-K)
    Z := F(N); -- def (Z), c-use(N)
    return Z / (X * Y); -- c-use(X, Y, Z)
end G;
