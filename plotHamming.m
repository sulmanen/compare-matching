function plotHamming(path, type, db)
%% Create plot of hamming distance effect
hams = [1, 2, 3, 4];
matches = [matchArray(760);matchArray(760);matchArray(760);matchArray(760)];
statsResult = [statsArray(4); statsArray(4)];

for maxHam = hams
    strcat(type, ' corpus for hamming ', maxHam, ' for path ', path)
    matches(maxHam, :) = corpus(path, type, maxHam, db, matches(maxHam, :));
end

for i = hams
    statsResult(i,:) = stats(matches(i,:));
end

matches = zeros(4);
realHams = [0,1,2,3];

for i = hams
    matches(i) = statsResult(i,1).Matches/statsResult(i,1).Total;
end
subplot(3, 1,1);
plot(realHams,matches);

falsePostitive = zeros(4);
for i = hams
    falsePositive(i) = statsResult(i).FalsePositive /statsResult(i).Total;
end
subplot(3, 1,2);
plot(realHams, falsePositive);

misses = zeros(4);
for i = hams
    misses(i) = (statsResult(i).Total - (statsResult(i).Matches + statsResult(i).FalsePositive)) / statsResult(i).Total;
end
subplot(3, 1,3);
plot(realHams, misses);


end