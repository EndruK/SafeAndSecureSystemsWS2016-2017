with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;
procedure Calculator is
    Result   : Integer;
    Operator : Character;
    Operand  : Integer;
    User_Answer : Character;
begin
    Program_Loop:
    loop
        Put ("Enter an expression: ");
        Get (Result);
        loop
            loop
                Get (Operator);
                exit when Operator /= ' ';
            end loop;
            if Operator = '.' then
                Put (Result, Width => 1);
                exit;
            else
                Get (Operand);
                case Operator is
                    when '+' =>
                        Result := Result + Operand;
                    when '-' =>
                        Result := Result - Operand;
                    when '*' =>
                        Result := Result * Operand;
                    when '/' =>
                        Result := Result / Operand;
                    when others =>
                        Put ("Invalid operator '");
                        Put (Operator);
                        Put ("'");
                        exit;
                end case;
            end if;
        end loop;
        User_Input_Loop:
        loop
            New_Line;
            Put("Do you want to evaluate another expression?(y/n)");
            New_Line;
            Get(User_Answer);
            case User_Answer is
                when 'Y' | 'y' =>
                    exit User_Input_Loop;
                when 'N' | 'n' =>
                    exit Program_Loop;
                when others =>
                    Put("Wrong input! Please type either y or n");
            end case;
        end loop User_Input_Loop;
    end loop Program_Loop;
end Calculator;
