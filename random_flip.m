function flipped = random_flip(to_flip)
%Return the input vector with 2 element flipped

%Select random indexes to flip
first_index = ceil(rand()*size(to_flip, 2));
second_index = ceil(rand()*size(to_flip, 2));

%Make sure the indexes are different
while (first_index == second_index)
    second_index = ceil(rand()*size(to_flip, 2));
end

%Flip the elements
flipped = to_flip;
flipped(first_index) = to_flip(second_index);
flipped(second_index) = to_flip(first_index);

end