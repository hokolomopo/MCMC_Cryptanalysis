%q est la fonction de probabilité conditionnelle
%start_state est la permutation initiale
%length est la longueur de la chaine

function result = Metro_Hast (start_state, length)
current_state = start_state;
result = zeros(length, size(start_state, 2));
result(1, :) = start_state;

D = fileread('D.txt');
D_int = arrayfun(@(x) symbol_to_int(x), D);

pi_0 = load('pinit.mat');
pi_0 = pi_0.pinit;
load Q;
p = genp(D_int, Q, pi_0);

for i = 2:length
    y = random_number(q(current_state, :));
    tmp_alpha = (p(y))/(p(current_state));
    alpha = min([1 tmp_alpha]);
    u = rand();
    if (u < alpha)
        current_state = y;
    end
    result(i) = current_state;
end
end