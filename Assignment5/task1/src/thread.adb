-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package body Thread with
    Spark_Mode is
    procedure Initialize is
    begin --Initialize
        S := Ready;
    end Initialize;

--------------------------------------------------------------------------------

    procedure Do_Action(A: Action) is
    begin --Do_Action
        case A is
            when Start =>
                if S = Ready then
                    S := Running;
                else
                    S := None;
                end if;
            when Stop =>
                if S = Ready or S = Running then
                    S := Stopped;
                else
                    S := None;
                end if;
            when Notify =>
                if S = Waiting then
                    S := Running;
                else
                    S := None;
                end if;
            when Wait =>
                if S = Running then
                    S := Waiting;
                else
                    S := None;
                end if;
            when Resume =>
                if S = Sleeping then
                    S := Running;
                else
                    S := None;
                end if;
            when Sleep =>
                if S = Running then
                    S := Sleeping;
                else
                    S := None;
                end if;
        end case;
        -- if S = None then
            -- raise Illegal_Transition;
        -- end if;
    end Do_Action;
end Thread;
