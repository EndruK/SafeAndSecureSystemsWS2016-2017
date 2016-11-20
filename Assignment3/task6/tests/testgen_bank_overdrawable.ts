context with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;
        with Bank_Accounts; use Bank_Accounts;
        with Bank_Accounts.Overdrawable; use Bank_Accounts.Overdrawable;

code Ada.Text_IO.Put_Line("Begin testing: ");

***** Init new Overdrawable Account
define  Account : Overdrawable_Type;
test    null;
pass    Get_Balance(Account) = 0

***** Test Deposit on Overdrawable Account
define  Account : Overdrawable_Type;
test    Deposit(Account, 10);
pass    Get_Balance(Account) = 10

***** Test Deposit Multiple on Overdrawable Account
define  Account : Overdrawable_Type;
test    Deposit(Account, 10);
        Deposit(Account, 35);
pass    Get_Balance(Account) = 45

***** Test Deposit Negative on Overdrawable Account
define  Account : Overdrawable_Type;
        Except : Boolean := False;
test    begin
            Deposit(Account,-10);
        exception
            when Invalid_Amount_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account) = 0

***** Test Withdraw on Overdrawable Account
define  Account : Overdrawable_Type;
prepare Deposit(Account, 30);
test    Withdraw(Account, 20);
pass    Get_Balance(Account) = 10

***** Test Withdraw with overdraw on Overdrawable Account
define  Account : Overdrawable_Type;
test    Withdraw(Account, 30);
pass    Get_Balance(Account) = -30

***** Test Withdraw with overdraw and positive balance on Overdrawable Account
define  Account : Overdrawable_Type;
prepare Deposit(Account, 50);
test    Withdraw(Account, 160);
pass    Get_Balance(Account) = -110

***** Test Withdraw with overdraw and negative balance on Overdrawable Account
define  Account : Overdrawable_Type;
prepare Withdraw(Account, 50);
test    Withdraw(Account, 160);
pass    Get_Balance(Account) = -210

***** Test Withdraw on Overdraw Limit on Overdrawable Account
define  Account : Overdrawable_Type;
        Except : Boolean := False;
test    begin
            Withdraw(Account, 2000);
        exception
            when Overspent_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account) = 0

***** Test Withdraw with negative amount on Overdrawable Account
define  Account : Overdrawable_Type;
        Except : Boolean := False;
test    begin
            Withdraw(Account, -20);
        exception
            when Invalid_Amount_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account) = 0

***** Test Transfer from Overdrawable Account to Normal Account
define  Account_1 : Overdrawable_Type;
        Account_2 : Account_Type;
test    Transfer(Account_1, Account_2, 20);
pass    Get_Balance(Account_1) = -20
        and Get_Balance(Account_2) = 20

***** Test Transfer from Overdrawable Account to Overdrawable Account
define  Account_1 : Overdrawable_Type;
        Account_2 : Overdrawable_Type;
test    Transfer(Account_1, Account_2, 20);
pass    Get_Balance(Account_1) = -20
        and Get_Balance(Account_2) = 20

***** Test Transfer from Normal Account to Overdrawable Account
define  Account_1 : Account_Type;
        Account_2 : Overdrawable_Type;
prepare Deposit(Account_1,50);
test    Transfer(Account_1, Account_2, 20);
pass    Get_Balance(Account_1) = 30
        and Get_Balance(Account_2) = 20

***** Test Transfer from Normal Account to Overdrawable Account with 0 Balance
define  Account_1 : Account_Type;
        Account_2 : Overdrawable_Type;
        Except : Boolean := False;
test    begin
            Transfer(Account_1, Account_2, 50);
        exception
            when Overspent_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account_1) = 0
        and Get_Balance(Account_2) = 0

***** Test Transfer from Overdrawable Account at the limit
define  Account_1 : Overdrawable_Type;
        Account_2 : Overdrawable_Type;
        Except : Boolean := False;
prepare Withdraw(Account_1, Overdraw_Limit);
test    begin
            Transfer(Account_1, Account_2, 20);
        exception
            when Overspent_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account_1) = -Overdraw_Limit
        and Get_Balance(Account_2) = 0

code Ada.Text_IO.Put_Line("End testing");
