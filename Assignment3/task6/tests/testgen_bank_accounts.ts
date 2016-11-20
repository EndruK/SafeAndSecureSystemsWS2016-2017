-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
context with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;
        with Bank_Accounts; use Bank_Accounts;

code Ada.Text_IO.Put_Line("Begin testing: ");

***** Init new Bank Account
define  Account : Account_Type;
test    null;
pass    Get_Balance(Account) = 0

***** Test Deposit on Bank Account
define  Account : Account_Type;
test    Deposit(Account, 20);
pass    Get_Balance(Account) = 20

***** Test Deposit Multiple on Bank Account
define  Account : Account_Type;
test    Deposit(Account, 20);
        Deposit(Account, 30);
pass    Get_Balance(Account) = 50

***** Test Deposit with negative on Bank Account
define  Account : Account_Type;
        Except : Boolean := False;
test    begin
            Deposit(Account, -2);
        exception
            when Invalid_Amount_Exception => Except := True;
        end;
pass    Except

***** Test Withdraw on Bank Account
define  Account : Account_Type;
prepare Deposit(Account, 20);
test    Withdraw(Account, 5);
pass    Get_Balance(Account) = 15

***** Test Withdraw Multiple on Bank Account
define  Account : Account_Type;
prepare Deposit(Account, 50);
test    Withdraw(Account, 10);
        Withdraw(Account, 3);
pass    Get_Balance(Account) = 37

***** Test Withdraw with negative on Bank Account
define  Account : Account_Type;
        Except : Boolean := False;
prepare Deposit(Account, 50);
test    begin
            Withdraw(Account, 60);
        exception
            when Overspent_Exception => Except := True;
        end;
pass    Except

***** Test Transfer on Bank Account
define  Account_1 : Account_Type;
        Account_2 : Account_Type;
prepare Deposit(Account_1, 50);
        Deposit(Account_2, 50);
test    Transfer(Account_1, Account_2, 20);
pass    Get_Balance(Account_1) = 30
        and Get_Balance(Account_2) = 70

***** Test Transfer with negative Amount on Bank Account
define  Account_1 : Account_Type;
        Account_2 : Account_Type;
        Except : Boolean := False;
prepare Deposit(Account_1, 50);
        Deposit(Account_2, 50);
test    begin
            Transfer(Account_1, Account_2, -20);
        exception
            when Invalid_Amount_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account_1) = 50
        and Get_Balance(Account_2) = 50

***** Test Transfer with empty Account on Bank Account
define  Account_1 : Account_Type;
        Account_2 : Account_Type;
        Except : Boolean := False;
test    begin
            Transfer(Account_1, Account_2, 30);
        exception
            when Overspent_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account_1) = 0
        and Get_Balance(Account_2) = 0



code Ada.Text_IO.Put_Line("End testing");
