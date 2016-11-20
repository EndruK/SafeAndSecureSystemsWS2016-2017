-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package body Bank_Accounts is
    -- Returns the current Balance from Account.
    -- Pre Check Account
    -- Excistence, valid account_type
    function Get_Balance(Account: Account_Type) return Cents_Type is
    begin
        return Account.Balance;
    end Get_Balance;

    -- Deposits Amount at the given Account.
    procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) is
    begin
        Account.Balance := Get_Balance(Account) + Amount;
    end Deposit;

    -- Withdraws Amount from the given Account.
    procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
    begin
        Account.Balance := Get_Balance(Account) - Amount;
    end Withdraw;

    procedure Transfer(From: in out Account_Type;
                       To: in out Account_Type;
                       Amount: in Cents_Type) is
    begin
        Withdraw(From, Amount);
        Deposit(To, Amount);
    end Transfer;
end Bank_Accounts;
