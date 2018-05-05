function [ y ] = random_flip_close(to_flip)

random = ceil(rand(1) * length(to_flip));
if random == length(to_flip)
    random = random - 1;
end

tmp = to_flip(random);
to_flip(random) = to_flip(random+1);
to_flip(random + 1) = tmp;

y = to_flip;

end

