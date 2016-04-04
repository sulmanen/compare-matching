%% for all jpg calc simplehash and dct hash
files = dir('data/paintings/00*.jpg');
i = 1;

%% for all t h and png find match
for file = files'
    file.name 
    db(i) = HashEntry;
    db(i).File = file.name;
    db(i).Simple = simplehash(strcat('data/paintings/',file.name));
    db(i).Dct = dcthash(strcat('data/paintings/',file.name));
    i = i + 1;
end

%% record stats for the match

%% find matches using new algorigthm and record results

