%q est la fonction de probabilité conditionnelle
%start_state est la permutation initiale
%length est la longueur de la chaine

function result = Metro_Hast (start_state, length)
current_state = start_state;
result = zeros(length, size(start_state, 2));
result(1, :) = start_state;

D = fileread('D.txt');
D_int = arrayfun(@(x) symbol_to_int(x), D(1:(end -1)));

pi_0 = load('pinit.mat');
pi_0 = pi_0.pinit;
load Q;

for i = 2:length
    y = random_flip(current_state);
    [lol, log_p_x] = decode_prob(D_int, current_state, Q, pi_0);
    [~, log_p_y] = decode_prob(D_int, y, Q, pi_0);
    log_tmp_alpha = log_p_y - log_p_x;
    tmp_alpha = exp(log_tmp_alpha);
    alpha = min([1 tmp_alpha]);
    if (rand() < alpha || ISNAN(alpha))
        current_state = y;
    end
    result(i, :) = current_state;
end
end