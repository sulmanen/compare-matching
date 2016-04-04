function hash = dcthash(path)
im = imread(path);

hash = uint64(0);

rez = imresize(im, [32,32]);

gray = rgb2gray(rez);

y = dct(double(gray));

avg = sum(sum(y(1:8,1:8)));

avg = avg - y(1:1);

avg = avg / 63;

for i = 1:8
    for k = 1:8
        if i ~= 0 && k ~= 0
            if y(i,k) > avg
                hash(1) = bitor(hash(1), uint64(1));
            else
                hash(1) = bitor(hash(1), uint64(0));
            end
            hash(1) = bitshift(hash(1), 1, 'uint64');
        end
    end
end
