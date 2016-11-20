-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Bank_Accounts; use Bank_Accounts;
package Bank_Accounts.Overdrawable is
    type Overdrawable_Type is new Account_Type with null record;
    Overdraw_Limit : constant Cents_Type := 1000;
    procedure Withdraw(Account: in out Overdrawable_Type; Amount: Cents_Type);
    procedure Transfer(From : in out Overdrawable_Type;
                       To : in out Account_Type;
                       Amount : Cents_Type);
    procedure Transfer(From : in out Overdrawable_Type;
                       To : in out Overdrawable_Type;
                       Amount : Cents_Type);
    procedure Transfer(From : in out Account_Type;
                       To : in out Overdrawable_Type;
                       Amount : Cents_Type);
end Bank_Accounts.Overdrawable;
