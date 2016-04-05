function match = matchLSIR(file, imdb)
match = MatchEntry;
res = search(imdb, file, 'box', []);

if isstruct(res)
    scores = res.geom.scores ;
else
    scores = res ;
end

%% pick the highest score
[scores, perm] = sort(scores, 'descend') ;
ii = perm(1); 
fileIdx = strrep(strrep(strrep(file, 't0', '0'),'h0', '0'), '../practical-object-instance-recognition/data/paintings/','');
%% if paths match, we have a correct match
match.Correct = strcmp(imdb.images.name(ii), fileIdx);
match.Type = 'lsir';
match.File = file;
end
