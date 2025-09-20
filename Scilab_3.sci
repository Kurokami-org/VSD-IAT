clc;
clear all; 
close all;

msg = [1 0 1 0];// d0 d1 d2 d3
 
p0 = bitxor(bitxor(msg(1), msg(2)), msg(4));
p1 = bitxor(bitxor(msg(1), msg(3)), msg(4));
p2 = bitxor(bitxor(msg(2), msg(3)), msg(4));

ans = zeros(1, 7);

ans(1) = p0;

parity = [p1, p2];

msg_idx = 1;
parity_idx = 1;

for n = 2 : 7
    if (log2(n) == floor(log2(n)))
        ans(n) = parity(parity_idx);
        parity_idx = parity_idx + 1;

    else
        ans(n) = msg(msg_idx);
        msg_idx = msg_idx + 1;
    end
end

disp(ans);
