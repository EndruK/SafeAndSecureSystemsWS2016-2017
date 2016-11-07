-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package Bank_Accounts is
    pragma Assertion_Policy(Check);
    subtype Cents_Type is Integer;
    type Account_Type is record
        Balance: Cents_Type := 0;
    end record;

    function Get_Balance(Account: Account_Type) return Cents_Type with
        Post => Account'Old.Balance = Account.Balance;
    -- Returns the current Balance from Account.
    procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) with
        Pre  => (Amount > 0)
            and then (Get_Balance(Account) <= Integer'Last - Amount),
        Post => Get_Balance(Account'Old) + Amount = Get_Balance(Account);
    -- Deposits Amount at the given Account.
    procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) with
        Pre  => (Amount > 0)
            and then (Integer'Last - Amount >= 0)
            and then (Get_Balance(Account) >= 0 + Amount),
        Post => Get_Balance(Account'Old) - Amount = Get_Balance(Account);
    -- Withdraws Amount from the given Account.
    procedure Transfer(From: in out Account_Type;
                       To: in out Account_Type;
                       Amount: in Cents_Type) with
        Pre => From /= To and then Amount <= Integer'Last and then Amount > 0;
    -- Transfers Amount from Account From to Account To.
end Bank_Accounts;
