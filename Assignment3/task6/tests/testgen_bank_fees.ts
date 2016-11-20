-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
context with Ada.Assertions; use Ada.Assertions;
        with Ada.Text_IO; use Ada.Text_IO;
        with Bank_Accounts; use Bank_Accounts;
        with Bank_Accounts.Fees; use Bank_Accounts.Fees;

code Ada.Text_IO.Put_Line("Begin testing: ");

***** Init new Fee Account
define  Account : Fees_Type;
test    null;
pass    Get_Balance(Account) = 0

***** Test Deposit on Fee Account
define  Account : Fees_Type;
test    Deposit(Account, 10);
pass    Get_Balance(Account) = 10

***** Test Multiple Deposit on Fee Account
define  Account : Fees_Type;
test    Deposit(Account, 20);
        Deposit(Account, 45);
pass    Get_Balance(Account) = 65

***** Test Deposit with negative amount on Fee Account
define  Account : Fees_Type;
        Except : Boolean := True;
test    begin
            Deposit(Account, -20);
        exception
            when Invalid_Amount_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account) = 0

***** Test Withdraw on Fee Account
define  Account : Fees_Type;
prepare Deposit(Account, 30);
test    Withdraw(Account, 10);
pass    Get_Balance(Account) = 20 - Fee

***** Test Withdraw not possible on Fee Account
define  Account : Fees_Type;
        Except : Boolean := False;
prepare Deposit(Account, 10);
test    begin
            Withdraw(Account, 10);
        exception
            when Overspent_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account) = 10

***** Test Withdraw with negative amount on Fee Account
define  Account : Fees_Type;
        Except : Boolean := False;
test    begin
            Withdraw(Account, -20);
        exception
            when Invalid_Amount_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account) = 0

***** Test Transfer from Fee Account to normal Account
define  Account_1 : Fees_Type;
        Account_2 : Account_Type;
prepare Deposit(Account_1, 30);
test    Transfer(Account_1, Account_2, 20);
pass    Get_Balance(Account_1) = 10 - Fee
        and Get_Balance(Account_2) = 20

***** Test Transfer from Fee Account to Fee Account
define  Account_1 : Fees_Type;
        Account_2 : Fees_Type;
prepare Deposit(Account_1, 30);
test    Transfer(Account_1, Account_2, 20);
pass    Get_Balance(Account_1) = 10 - Fee
        and Get_Balance(Account_2) = 20

***** Test Transfer from Normal Account to Fee Account
define  Account_1 : Account_Type;
        Account_2 : Fees_Type;
prepare Deposit(Account_1, 30);
test    Transfer(Account_1, Account_2, 20);
pass    Get_Balance(Account_1) = 10
        and Get_Balance(Account_2) = 20

***** Test Transfer with negative Amount
define  Account_1 : Fees_Type;
        Account_2 : Fees_Type;
        Except : Boolean := False;
prepare Deposit(Account_1, 30);
test    begin
            Transfer(Account_1, Account_2, -20);
        exception
            when Invalid_Amount_Exception => Except := True;
        end;
pass    Except
        and Get_Balance(Account_1) = 30
        and Get_Balance(Account_2) = 0

code Ada.Text_IO.Put_Line("End testing");
