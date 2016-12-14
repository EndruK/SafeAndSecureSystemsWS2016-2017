-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
pragma SPARK_Mode(on);
package body Thread is
    procedure Initialize is
    begin --Initialize
        Thread.S := Ready;
    end Initialize;

--------------------------------------------------------------------------------

    procedure Do_Action(A: Action) is
    begin --Do_Action
        case A is
            when Start =>
                if Thread.S = Ready then
                    Thread.S := Running;
                else
                    Thread.S := None;
                end if;
            when Stop =>
                if Thread.S = Ready or Thread.S = Running then
                    Thread.S := Stopped;
                else
                    Thread.S := None;
                end if;
            when Notify =>
                if Thread.S = Waiting then
                    Thread.S := Running;
                else
                    Thread.S := None;
                end if;
            when Wait =>
                if Thread.S = Running then
                    Thread.S := Waiting;
                else
                    Thread.S := None;
                end if;
            when Resume =>
                if Thread.S = Sleeping then
                    Thread.S := Running;
                else
                    Thread.S := None;
                end if;
            when Sleep =>
                if Thread.S = Running then
                    Thread.S := Sleeping;
                else
                    Thread.S := None;
                end if;
        end case;
        -- if Thread.S = None then
            -- raise Illegal_Transition;
        -- end if;
    end Do_Action;
end Thread;
