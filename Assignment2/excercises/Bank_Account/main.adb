-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO, Bank_Accounts, Ada.Integer_Text_IO;
use Ada.Text_IO, Bank_Accounts, Ada.Integer_Text_IO;
procedure Main is
    Acc1 : Account_Type;
    Acc2 : Account_Type;
begin -- Main
    Deposit(Acc1,Integer'Last);
    Transfer(Acc1,Acc2,Integer'Last);
    Put(Get_Balance(Acc1));
    Put(Get_Balance(Acc2));
end Main;
