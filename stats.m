function s = stats(matches)
s = MatchStat;
s.Type = matches(1).Type;

for match = matches
    if match.Correct > 0
        s(1).Matches = s(1).Matches + 1;
    end
    
    if isempty(match.Correct)
        s(1).FalsePositive =  s(1).FalsePositive + 1;
        match.File;
    end
end
s.Total = length(matches);
