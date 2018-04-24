function [prob, logProb] = decode_prob(chain, key, Q, p0)

decoded_chain = decode(chain, key);

[prob, logProb] = genp(decoded_chain, Q, p0);


end