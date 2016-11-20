with Bank_Accounts; use Bank_Accounts;
package Bank_Accounts.Fees is
    type Fees_Type is new Account_Type with null record;
    Fee : constant Cents_Type := 3;
    procedure Withdraw(Account: in out Fees_Type; Amount: Cents_Type);
    procedure Transfer(From : in out Fees_Type;
                       To : in out Account_Type;
                       Amount : Cents_Type);
    procedure Transfer(From : in out Fees_Type;
                       To : in out Fees_Type;
                       Amount : Cents_Type);
    procedure Transfer(From : in out Account_Type;
                       To : in out Fees_Type;
                       Amount : Cents_Type);
end Bank_Accounts.Fees;
