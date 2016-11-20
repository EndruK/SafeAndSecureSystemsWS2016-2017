-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
with Ada.Text_IO; use Ada.Text_IO;

package body thread is
    procedure Initialize(S: out State) is
    begin --Initialize
        S := Ready;
        Put_Line("Initialize");
    end Initialize;

    procedure Do_Action(S: in out State; A: Action) is
    begin --Do_Action
        case A is
            when Start =>
                if S = Ready then
                    Put_Line("Action was Start.");
                    S := Running;
                else
                    S := None;
                    Put_Line("FAILED! State was not Ready.");
                end if;
            when Stop =>
                if S = Ready or S = Running then
                    Put_Line("Action was Stop.");
                    S := Stopped;
                else
                    S := None;
                    Put_Line("FAILED! State was not Ready nor Running.");
                end if;
            when Notify =>
                if S = Waiting then
                    Put_Line("Action was Notify.");
                    S := Running;
                else
                    S := None;
                    Put_Line("FAILED! State was not Waiting.");
                end if;
            when Wait =>
                if S = Running then
                    Put_Line("Action was Wait.");
                    S := Waiting;
                else
                    S := None;
                    Put_Line("FAILED! State was not Running.");
                end if;
            when Resume =>
                if S = Sleeping then
                    Put_Line("Action was Resume.");
                    S := Running;
                else
                    S := None;
                    Put_Line("FAILED! State was not Sleeping.");
                end if;
            when Sleep =>
                if S = Running then
                    Put_Line("Action was Sleep.");
                    S := Sleeping;
                else
                    S := None;
                    Put_Line("FAILED! State was not Running.");
                end if;
        end case;
    end Do_Action;
end Thread;
