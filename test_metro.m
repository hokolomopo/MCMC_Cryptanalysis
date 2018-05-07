function seq = test_metro

D = fileread('D.txt');
D_int = arrayfun(@(x) symbol_to_int(x), D(1:(end -1)));

load Q;

pi_0 = load('pinit.mat');
pi_0 = pi_0.pinit;

start_state = 1:40;
[nbIterations, mar_chaine] = Metro_Hast(D_int, Q, pi_0, start_state, 'random_flip', 200, 20000);

result = mar_chaine(end, :);

decoded = decode(D_int, result);

seq = arrayfun(@(x) int_to_symbol(x), decoded)
nbIterations

end