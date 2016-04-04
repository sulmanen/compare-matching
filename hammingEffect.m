%% Create plot of hamming distance effect 
%% on matches misses and false positives

hams = [1, 2, 3, 4];
matchesDCT = [matchArray(760);matchArray(760);matchArray(760);matchArray(760)];
matchesDCTHalf = [matchArray(760);matchArray(760);matchArray(760);matchArray(760)];

statsDCT = [statsArray(4); statsArray(4)];

for maxHam = hams
    strcat('Dct corpus for hamming ', maxHam)
    matchesDCT(maxHam, :) = corpus('../practical-object-instance-recognition/data/paintings/t00*.jpg', 'dct', maxHam, db, matchesDCT(maxHam, :));
end

for i = hams
    statsDCT(i,:) = stats(matchesDCT(i,:));
end

matches = zeros(4);
realHams = [0,1,2,3];

for i = hams
    matches(i) = statsDCT(i,1).Matches/statsDCT(i,1).Total;
end
subplot(3, 1,1);
plot(realHams,matches);

falsePostitive = zeros(4);
for i = hams
    falsePositive(i) = statsDCT(i).FalsePositive /statsDCT(i).Total;
end
subplot(3, 1,2);
plot(realHams, falsePositive);

misses = zeros(4);
for i = hams
    misses(i) = (statsDCT(i).Total - (statsDCT(i).Matches + statsDCT(i).FalsePositive)) / statsDCT(i).Total;
end
subplot(3, 1,3);
plot(realHams, mises);

