function test_metro

start_state = 1:40;
mar_chaine = Metro_Hast(start_state, 1000);

result = mar_chaine(end, :);

D = fileread('D.txt');

decoded = decode(D, result)

%seq = arrayfun(@(x) int_to_symbol(x), decoded)

end