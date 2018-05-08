function [prob, logProb] = decode_prob(chain, key, Q, p0)
%Give the probability of thechain decoded with the given key

%Decode the chain
decoded_chain = decode(chain, key);

%Compute it's probability
[prob, logProb] = genp(decoded_chain, Q, p0);


end