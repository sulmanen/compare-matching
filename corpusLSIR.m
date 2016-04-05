% loop through all the images and find a match
function data = corpusLSIR(files)
    files = dir(filesPath);
    i = 1;
    for file = files'
        data(i) = matchLSIR(strcat('../practical-object-instance-recognition/data/paintings/', file.name));
        i = i + 1;
    end
end