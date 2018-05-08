function rnd = random_number(prob)
%Generate a random number with probabilities given as argument

x = rand();

curr = 0;
rnd = -1;
siz = size(prob);

for i = 1:siz(2)
    curr = curr + prob(i);
    if (x < curr)
        rnd = i;
        break;
    end 
end

end