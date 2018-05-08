function [p, logp] = genp(chain, Q, p0)
%Compute the probability of a sequence witha  given Q and pi_0
%   Compute everything with logarithms to avoid rounding error

logp =  log(p0(chain(1)));

for k=2:size(chain, 2)
    logp = logp + log( Q(chain(k-1), chain(k)) );
end

p = exp(logp);

end
