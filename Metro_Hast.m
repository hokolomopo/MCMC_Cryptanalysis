%q est la fonction de probabilité conditionnelle
%start_state est la permutation initiale
%length est la longueur de la chaine

function [nbIterations, result] = Metro_Hast (start_state, q, convergeance, limitIterations)
current_state = start_state;
nbIterations = 1;
consecutiveResult = 1;
result(1, :) = start_state;

D = fileread('D.txt');
D_int = arrayfun(@(x) symbol_to_int(x), D(1:(end -1)));

pi_0 = load('pinit.mat');
pi_0 = pi_0.pinit;
load Q;
Q(Q==0) = 1e-10;

while consecutiveResult < convergeance && nbIterations < limitIterations
    nbIterations = nbIterations + 1;
    y = feval(q, current_state);
    [~, log_p_x] = decode_prob(D_int, current_state, Q, pi_0);
    
    currents(nbIterations) = log_p_x;
    
    [~, log_p_y] = decode_prob(D_int, y, Q, pi_0);
    log_tmp_alpha = log_p_y - log_p_x;
    tmp_alpha = exp(log_tmp_alpha);
    alpha = min([1 tmp_alpha]);
    if (rand() < alpha || isnan(alpha))
        current_state = y;
        consecutiveResult = 1;
    else
        consecutiveResult = consecutiveResult + 1;
    end
    result(nbIterations, :) = current_state;
end

plot((2:nbIterations), currents(2:end));

end