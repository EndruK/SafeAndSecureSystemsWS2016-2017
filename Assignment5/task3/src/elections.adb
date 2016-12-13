-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
pragma SPARK_Mode(on);
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body Elections is

    procedure Initialize(Num_Voters: Natural) is
    begin -- Initialize
        Num_Votes_Made := 0;
        Votes_Distribution := Zero_Votes_Distribution;
        Num_Total_Voters := Num_Voters;
    end Initialize;

--------------------------------------------------------------------------------

    procedure Vote_For(Vote: Party) is
    begin -- Vote_For
        -- are there still votes left
        if not All_Voters_Voted then
            -- Put_Line("Thanks for the vote!");
            -- increment the votes for the selected party
            Votes_Distribution(Vote) := Votes_Distribution(Vote) + 1;
            -- increment the number of votes made
            Num_Votes_Made := Num_Votes_Made + 1;
        -- else
            -- when all voters already voted
            -- Put_Line("Not counting the vote! All votes made!");
        end if;
    end Vote_For;

--------------------------------------------------------------------------------

    function All_Voters_Voted return Boolean is
    begin -- All_Voters_Voted
        -- return true if num of total voters reached
        return Num_Votes_Made >= Num_Total_Voters;
    end All_Voters_Voted;

--------------------------------------------------------------------------------

    function Find_Winner return Party is
        highest_vote : Natural := 0;
        Winner : Party := None;
    begin -- Find_Winner
        -- loop over all parties in the vote distribution
        for P in Votes_Distribution'Range loop
            if Votes_Distribution(P) > highest_vote then
                -- if the value of the current party is higher
                -- set the current highest vote and election winner
                highest_vote := Votes_Distribution(P);
                Winner := P;
            elsif Votes_Distribution(P) = highest_vote and P /= Winner then
                -- if at least 2 parties share a count set winner to none
                Winner := None;
            end if;
        end loop;
        return Winner;
    end Find_Winner;

end Elections;
