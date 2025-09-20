clc;
clear all; 
close all;

m = [1 0 1 1 0 1 1 0 0 1];

x = poly(0,"x");
pol = 1 + x + x^3;
d = degree(pol);
generator = [1 0 1 1];
n = length(generator);

m_appended = [m, zeros(1,d)];

for i = 1 : (length(m_appended) - n + 1)
    if m_appended(i) == 1
        m_appended(i : i + n -1) = bitxor(m_appended(i : i + n -1) ,generator);
    end
end

remainder = m_appended($-(n-2):$);

code_word = [m ,remainder];
disp("Transmitted codeword:");
disp(code_word);

// --- Receiver Side ---
rx = code_word;   // assume received without error

for i = 1 : (length(rx) - n + 1)
    if rx(i) == 1
        rx(i : i + n -1) = bitxor(rx(i : i + n -1), generator);
    end
end

rem_rx = rx($-(n-2):$);
disp("Remainder at receiver:");
disp(rem_rx);
