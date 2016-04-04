function y = simplehash(url)
hash = uint64([0, 0]);
gray = rgb2gray(imresize(imread(url), [8,8]));

%% grayscale
avg = floor(sum(sum(gray)) / 64);

%% accumulate rgb pixel bitwise and 0xFF
for i = 1:8
    for k = 1:8
        if gray(i,k) > avg
            hash(1) = bitor(hash(1), uint64(1));
        else
            hash(1) = bitor(hash(1), uint64(0));
        end
        hash(1) = bitshift(hash(1), 1, 'uint64');
    end
end

for i = 0:7
    for k = 1:8
        if gray(8 - i,k) > avg
            hash(2) = bitor(hash(2), uint64(1));
        else
            hash(2) = bitor(hash(2), uint64(0));
        end
        hash(2) = bitshift(hash(2), 1, 'uint64');
    end
end
y = hash(1);