function test_metro

start_state = 1:40;
mar_chaine = Metro_Hast(start_state, 10000);

result = mar_chaine(end, :);

D = fileread('D.txt');
D_int = arrayfun(@(x) symbol_to_int(x), D(1:(end -1)));

decoded = decode(D_int, result);

seq = arrayfun(@(x) int_to_symbol(x), decoded)

end