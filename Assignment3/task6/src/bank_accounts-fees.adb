-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package body Bank_Accounts.Fees is

    procedure Withdraw(Account: in out Fees_Type; Amount: Cents_Type) is
    begin
        if Amount <= 0 then
            raise Invalid_Amount_Exception;
        end if;
        if Account.Balance >= Fee + Amount then
            Account.Balance := Account.Balance - Fee - Amount;
        else
            raise Overspent_Exception;
        end if;
    end Withdraw;

--------------------------------------------------------------------------------

    procedure Transfer(From : in out Fees_Type;
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

    procedure Transfer(From : in out Fees_Type;
                       To : in out Fees_Type;
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
                       To : in out Fees_Type;
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

end Bank_Accounts.Fees;
