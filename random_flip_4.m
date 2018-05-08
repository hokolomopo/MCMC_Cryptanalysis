function [ y ] = random_flip_4(to_flip)
%Return the input vector with 2 element flipped twice

y = random_flip(to_flip);
y = random_flip(y);

end

