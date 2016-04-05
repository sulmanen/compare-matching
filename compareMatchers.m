% Plot effect of hamming distance on the matching stats

% dct
plotHamming('../practical-object-instance-recognition/data/paintings/t00*.jpg','dct', db);
figure;

plotHamming('../practical-object-instance-recognition/data/paintings/h00*.jpg','dct', db);
figure;

% simple
plotHamming('../practical-object-instance-recognition/data/paintings/t00*.jpg','simple', db);
figure;
plotHamming('../practical-object-instance-recognition/data/paintings/h00*.jpg','simple', db);

