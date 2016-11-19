-- André Karge 110033
-- K. Gerrit Lünsdorf 100141
package Elections is
    pragma Assertion_Policy(Check);

    type Party is (None, A, B, C, D);
    type Votes_Array is array(Party) of Natural;

    Zero_Votes_Distribution: constant Votes_Array := (others => 0);
    Votes_Distribution: Votes_Array := Zero_Votes_Distribution;
    Num_Votes_Made: Natural := 0;
    Num_Total_Voters: Natural := 0;

    procedure Initialize(Num_Voters: Natural) with
        Pre  => Num_Voters <= Natural'Last
            and Num_Voters >= 0,
        Post => Num_Total_Voters = Num_Voters
            and Num_Votes_Made = 0
            and Votes_Distribution = Zero_Votes_Distribution;
    -- Resets the number of made votes and votes for all parties to 0, and
    -- sets the number of total Voters to the given.
    procedure Vote_For(Vote: Party) with
        Pre  => Num_Votes_Made < Num_Total_Voters,
        Post => Votes_Distribution(Vote) = Votes_Distribution(Vote)'Old + 1
            and Num_Votes_Made = Num_Votes_Made'Old + 1
            and Num_Total_Voters = Num_Total_Voters'Old;
    function All_Voters_Voted return Boolean with
        Post => Num_Votes_Made = Num_Votes_Made'Old
            and Num_Total_Voters = Num_Total_Voters'Old
            and Votes_Distribution = Votes_Distribution'Old
            and ((All_Voters_Voted'Result = True and Num_Votes_Made >= Num_Total_Voters)
                or (All_Voters_Voted'Result = False and Num_Votes_Made < Num_Total_Voters));
    function Find_Winner return Party with
        Post => Num_Votes_Made = Num_Votes_Made'Old
            and Num_Total_Voters = Num_Total_Voters'Old;
    -- Returns Party with most votes assigned.
    -- Returns None if multiple parties share the highest votes.
end Elections;
