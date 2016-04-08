function z = match(path, db, type, maxHamming, y)
i = 1;
if strcmp(type, 'simple')
    hash = simplehash(path);
    for entry = db
        ham = hamming(entry.Simple, hash);
        if  ham < maxHamming
            y(i) = MatchEntry;
            y(i).File = entry.File;
            y(i).Type = 'simple';
            y(i).Correct = strfind(path, entry.File);
            y(i).Hamming = ham;
            i = 1 + i;
        end
    end
else
    dct = dcthash(path);
    for entry = db
        ham = hamming(entry.Dct, dct);
        if ham < maxHamming
            y(i) = MatchEntry;
            y(i).File = entry.File;
            y(i).Type = 'dct';
            y(i).Correct = strfind(path, entry.File);
            y(i).Hamming = ham;
            i = 1 + i;
        end
    end
end
[~,idx]=sort([y.Hamming]);
y=y(idx);
z = y(1);
    
    