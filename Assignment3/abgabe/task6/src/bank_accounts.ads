-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package Bank_Accounts is
    subtype Cents_Type is Integer;
    Default_Balance : constant Cents_Type := 0;

    type Account_Type is tagged limited private;

    Overspent_Exception : exception;
    Invalid_Amount_Exception : exception;

    function Get_Balance(Account: Account_Type) return Cents_Type;
    -- Returns the current Balance from Account.
    procedure Deposit(Account: in out Account_Type; Amount: Cents_Type);
    -- Deposits Amount at the given Account.
    procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type);
    -- Withdraws Amount from the given Account.
    procedure Transfer(From: in out Account_Type;
                       To: in out Account_Type;
                       Amount: in Cents_Type);
    -- Transfers Amount from Account From to Account To.
private
    -- limited means that derived types cannot be assigned to each other
    -- tagged means that the type is allowed to be extended later
    type Account_Type is tagged limited record
        Balance: Cents_Type := Default_Balance;
    end record;
end Bank_Accounts;
