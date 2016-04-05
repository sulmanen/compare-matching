function match = matchLSIR(file, imdb)
match = MatchEntry;
res = search(imdb, file, 'box', []);

% get original image and compare to the one retrieved from db
actualMatchFile = strrep(file, 's0', '0');
actualMatchFile = strrep(actualMatchFile, 't0', '0');
actualIm = imread(actualMatchFile);
actualIm
if isstruct(res)
    scores = res.geom.scores ;
else
    scores = res ;
end

[scores, perm] = sort(scores, 'descend') ;
ii = perm(1) ; %% pick the highest score
im = getImage(imdb, ii, false) ;
if size(im,1) > 1024
    im = imresize(im, [1024 NaN]) ;
elseif size(im,2) > 1024
    im = imresize(im, [NaN 1024]) ;
end
match.Correct = isequal(im, actualIm);
match.Type = 'lsir';
match.File = file;
end
