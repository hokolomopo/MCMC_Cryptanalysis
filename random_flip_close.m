function [ y ] = random_flip_close(to_flip)
%Return the input vector with 2 elements next to each others flipped

%Select a random index
random = ceil(rand(1) * length(to_flip));
if random == length(to_flip)
    random = random - 1;
end

%Flip the elements
tmp = to_flip(random);
to_flip(random) = to_flip(random+1);
to_flip(random + 1) = tmp;

y = to_flip;

end

