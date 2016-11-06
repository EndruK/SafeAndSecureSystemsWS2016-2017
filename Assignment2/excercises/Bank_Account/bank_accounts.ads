with Ada.Text_IO;
use Ada.Text_IO;
package Bank_Accounts is
    subtype Cents_Type is Integer;
    type Account_Type is record
        Balance: Cents_Type := 0;
    end record;

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
end Bank_Accounts;
