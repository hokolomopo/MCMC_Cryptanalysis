function [nbIterations, result] = Metro_Hast (sequence, Q, pi_0, start_state, q, convergeance, limitIterations)
%Compute the Markov chain given by the Metropolis-Hastings algorithm
%   sequence is the sequence to decode
%   Q is the transition matrix of the alphabet
%   pi_0 initial probability distribution
%   q is the conditional probability function
%   start_state is the initial permutation
%   length is the lenght of the chain
%   convergeance is the number of constant iterations needed to declare
%       convergeance
%   limitIterations is the maximal number of iterations

current_state = start_state;
nbIterations = 1;
consecutiveResult = 1;
result(1, :) = start_state;

%Replace the probabilities equal to zero by very small probabilities
Q(Q==0) = 1e-10;

%Loop until convergence or limit reached
while consecutiveResult < convergeance && nbIterations < limitIterations
    nbIterations = nbIterations + 1;
    
    %Compute the next y with the distribution q
    y = feval(q, current_state);
    
    %Compute the probability of the current sequence and of the new sequence
    [~, log_p_x] = decode_prob(sequence, current_state, Q, pi_0);
    [~, log_p_y] = decode_prob(sequence, y, Q, pi_0);
    
    %Compute the alpha
    log_tmp_alpha = log_p_y - log_p_x;
    tmp_alpha = exp(log_tmp_alpha);
    alpha = min([1 tmp_alpha]);
    
    %Check is a randomly generated nulber is greater of smaller than alpha
    %to decide of next state
    if (rand() < alpha || isnan(alpha))
        current_state = y;
        consecutiveResult = 1;
    else
        consecutiveResult = consecutiveResult + 1;
    end

    %Remember current state
    result(nbIterations, :) = current_state;
end

end