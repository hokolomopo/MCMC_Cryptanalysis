function test_metro

D = fileread('D.txt');
D_int = arrayfun(@(x) symbol_to_int(x), D(1:(end -1)));

load Q;

start_state = 1:40;
[nbIterations, mar_chaine] = Metro_Hast(D_int, Q, start_state, 'random_flip_close', 120, 20000);

result = mar_chaine(end, :);

decoded = decode(D_int, result);

seq = arrayfun(@(x) int_to_symbol(x), decoded)
nbIterations

end