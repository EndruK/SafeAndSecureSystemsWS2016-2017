pragma SPARK_Mode(on);
package Elections is
    type Party is (None, A, B, C, D);
        type Votes_Array is array(Party) of Natural;

        Zero_Votes_Distribution: constant Votes_Array := (others => 0);
        Votes_Distribution: Votes_Array := Zero_Votes_Distribution;
        Num_Votes_Made: Natural := 0;
        Num_Total_Voters: Natural := 0;

        procedure Initialize(Num_Voters: in Natural) with
            Pre  => Num_Voters <= Natural'Last
                and Num_Voters >= 0,
            Post => Num_Total_Voters = Num_Voters
                and Num_Votes_Made = 0
                and Votes_Distribution = Zero_Votes_Distribution,
            Global => (
                Output => (
                    Votes_Distribution,
                    Num_Votes_Made,
                    Num_Total_Voters
                )
            ),
            Depends => (
                Num_Total_Voters => (Num_Voters),
                Num_Votes_Made => null,
                Votes_Distribution => null
                -- null because medium: constant without variable input
                -- "Zero_Votes_Distribution" cannot appear in Depends
            );
        -- Resets the number of made votes and votes for all parties to 0, and
        -- sets the number of total Voters to the given.
        procedure Vote_For(Vote: Party) with
            Pre  => Num_Votes_Made < Num_Total_Voters
                and Vote in Party,
            Post => Votes_Distribution(Vote) = Votes_Distribution(Vote)'Old + 1
                and Num_Votes_Made = Num_Votes_Made'Old + 1
                and Num_Total_Voters = Num_Total_Voters'Old,
            Global => (
                Input => (Num_Total_Voters), -- r from check
                In_Out => (Votes_Distribution, Num_Votes_Made) -- r+w
            ),
            Depends => (
                Votes_Distribution => +(Vote, Num_Total_Voters, Num_Votes_Made),
                Num_Votes_Made => +(Num_Total_Voters, Votes_Distribution)
            );
        function All_Voters_Voted return Boolean with
            Post => Num_Votes_Made = Num_Votes_Made'Old
                and Num_Total_Voters = Num_Total_Voters'Old
                and Votes_Distribution = Votes_Distribution'Old
                and ((All_Voters_Voted'Result = True and Num_Votes_Made >= Num_Total_Voters)
                    or (All_Voters_Voted'Result = False and Num_Votes_Made < Num_Total_Voters)),
            Global => (
                Input => (Num_Votes_Made, Num_Total_Voters, Votes_Distribution)
            );

        function Find_Winner return Party with
            Post => Num_Votes_Made = Num_Votes_Made'Old
                and Num_Total_Voters = Num_Total_Voters'Old
                and Find_Winner'Result in Party,
            Global => (
                Input => (
                    Num_Votes_Made, Num_Total_Voters, Votes_Distribution
                )
            );
    -- Returns Party with most votes assigned.
    -- Returns None if multiple parties share the highest votes.
end Elections;
