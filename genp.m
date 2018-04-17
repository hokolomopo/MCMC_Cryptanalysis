function [p, logp] = genp(chain, Q, p0)

logp =  log(p0(chain(1)));


for k=2:size(chain, 2)

    logp = logp + log( Q(chain(k), chain(k-1)) );
    
end

p = exp(logp);

end
