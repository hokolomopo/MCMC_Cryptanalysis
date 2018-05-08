function seq = test_metro
%Test of our implementation of Metropolis-Hastings algorithm

%Read the sequance to decrypt
D = fileread('D.txt');

%Change chars into int
D_int = arrayfun(@(x) symbol_to_int(x), D(1:(end -1)));

%Load Q matrix and pinit
load Q;
pi_0 = load('pinit.mat');
pi_0 = pi_0.pinit;

%Use the Metropolis-Hastings algorithm
start_state = 1:40;
[nbIterations, mar_chaine] = Metro_Hast(D_int, Q, pi_0, start_state, 'random_flip', 200, 20000);

result = mar_chaine(end, :);

%Decode the chain with the code given by the Metropolis-Hastings algorithm
decoded = decode(D_int, result);
seq = arrayfun(@(x) int_to_symbol(x), decoded);

end