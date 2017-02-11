-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Password_Cracking;
with Password_Cracking_Context;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
    package PCC is new Password_Cracking_Context(Num_Password_Chars => 4, Num_Tasks => 2);
    package PC is new Password_Cracking(PCC);
    Hash_Array : PCC.Hash_Array_Type := ("535b82c80fa2805d71958d81eba421def23d310c","d501d3ec02af893f83107482b06013fc919eeb0b");
    Password_Array : PCC.Password_Array_Type := ("1111","1111");
    Success : Boolean := False;
begin
    Put_Line("########### MAIN ###########");
    PC.Find_Passwords(Hash_Array, Password_Array, Success);
end Main;
