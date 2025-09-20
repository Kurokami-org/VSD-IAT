clc;
clear;

// --- Sender Side ---
d = [1 0 1 0];   // data bits
p1 = bitxor(d(1), bitxor(d(2), d(4)));
p2 = bitxor(d(1), bitxor(d(3), d(4)));
p4 = bitxor(d(2), bitxor(d(3), d(4)));
codeword = [p1 p2 d(1) p4 d(2) d(3) d(4)];

disp(msprintf("Data Bits: %d %d %d %d", d));
disp(msprintf("Transmitted Codeword: %d %d %d %d %d %d %d", codeword));

// --- Receiver Side ---
rx = codeword;
rx(3) = ~rx(3);   // flip bit 3 to simulate error

d_rx = [rx(3) rx(5) rx(6) rx(7)];
p_rx = [rx(1) rx(2) rx(4)];

p1_calc = bitxor(d_rx(1), bitxor(d_rx(2), d_rx(4)));
p2_calc = bitxor(d_rx(1), bitxor(d_rx(3), d_rx(4)));
p4_calc = bitxor(d_rx(2), bitxor(d_rx(3), d_rx(4)));

c1 = bitxor(p_rx(1), p1_calc);
c2 = bitxor(p_rx(2), p2_calc);
c4 = bitxor(p_rx(3), p4_calc);
err_pos = c4*4 + c2*2 + c1;

if err_pos>0 then
    rx(err_pos) = ~rx(err_pos);
end

disp(msprintf("Error Position: %d", err_pos));
disp(msprintf("Corrected Data: %d %d %d %d", rx(3), rx(5), rx(6), rx(7)));
