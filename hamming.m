function y = hamming(u, v)

%% expect uint8

%% xor
tmp = bitxor(u,v, 'uint64');

%% count ones
tmp = cellstr(dec2bin(tmp)')';
y = 0;

for pos = tmp
   if strcmp(pos, '1')
      y = y + 1;
   end
end