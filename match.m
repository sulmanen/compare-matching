function y = match(path,db, type, maxHamming, y)
if strcmp(type, 'simple')
    hash = simplehash(path);
    for entry = db
        if hamming(entry.Simple, hash) < maxHamming
            y.File = entry.File;
            y.Type = 'simple';
            y.Correct = strfind(path, entry.File);
            break;
        end
    end
else
    dct = dcthash(path);
    for entry = db
        if hamming(entry.Dct, dct) < maxHamming
            y.File = entry.File;
            y.Type = 'dct';
            y.Correct = strfind(path, entry.File);
            break;
        end
    end
end