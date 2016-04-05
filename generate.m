%% build simple and dct hash database
files = dir('../practical-object-instance-recognition/data/paintings/00*.jpg');
i = 1;

for file = files'
    file.name 
    db(i) = HashEntry;
    db(i).File = file.name;
    db(i).Simple = simplehash(strcat('../practical-object-instance-recognition/data/paintings/',file.name));
    db(i).Dct = dcthash(strcat('../practical-object-instance-recognition/data/paintings/',file.name));
    i = i + 1;
end