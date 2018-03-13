function [prob_eq prob_c trans] = estimate_prob(t)

trans = transition_matrix;
trans = trans^t;

start = [0.25 0.25 0.25 0.25];
prob_eq = start*trans;

start = [0 0 1 0];
prob_c = start*trans;

end