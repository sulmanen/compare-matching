function data = corpus(filesPath, type, hamming, db, data)
files = dir(filesPath);
i = 1;
for file = files'
    data(i) = match(strcat('../practical-object-instance-recognition/data/paintings/', file.name), db, type, hamming,data(i)); 
    i = i + 1;
end