function [prob_eq prob_c trans] = estimate_prob(t)
%Compute the probability distribution at time t for
%a uniform starting prob (prob_eq) and a chain starting by c (prob_c).
%Also compute the transition matrix at time t (trans).
%This function is for the question 1.1.2

trans = transition_matrix;
trans = trans^t;

start = [0.25 0.25 0.25 0.25];
prob_eq = start*trans;

start = [0 0 1 0];
prob_c = start*trans;

end