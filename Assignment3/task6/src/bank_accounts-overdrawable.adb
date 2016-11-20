-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package body Bank_Accounts.Overdrawable is

    procedure Withdraw(Account: in out Overdrawable_Type; Amount: Cents_Type) is
    begin
        if Amount <= 0 then
            raise Invalid_Amount_Exception;
        end if;
        if Account.Balance - Amount >= -Overdraw_Limit then
            Account.Balance := Get_Balance(Account) - Amount;
        else
            raise Overspent_Exception;
        end if;
    end Withdraw;

--------------------------------------------------------------------------------

    procedure Transfer(From : in out Overdrawable_Type;
                       To : in out Account_Type;
                       Amount : Cents_Type) is
    begin
        if Amount <= 0 then
            raise Invalid_Amount_Exception;
        end if;
        begin
            Withdraw(From, Amount);
            Deposit(To, Amount);
        exception
            when Overspent_Exception => raise Overspent_Exception;
        end;
    end Transfer;

--------------------------------------------------------------------------------

    procedure Transfer(From : in out Overdrawable_Type;
                       To : in out Overdrawable_Type;
                       Amount : Cents_Type) is
    begin
        if Amount <= 0 then
            raise Invalid_Amount_Exception;
        end if;
        begin
            Withdraw(From, Amount);
            Deposit(To, Amount);
        exception
            when Overspent_Exception => raise Overspent_Exception;
        end;
    end Transfer;

--------------------------------------------------------------------------------

    procedure Transfer(From : in out Account_Type;
                       To : in out Overdrawable_Type;
                       Amount : Cents_Type) is
    begin
        if Amount <= 0 then
            raise Invalid_Amount_Exception;
        end if;
        begin
            Withdraw(From, Amount);
            Deposit(To, Amount);
        exception
            when Overspent_Exception => raise Overspent_Exception;
        end;
    end Transfer;

end Bank_Accounts.Overdrawable;
