function decoded= decode(chain, key)
%Decode a chain with the given key

decoded = zeros(1, size(chain,2));

for i=1:size(key, 2)
    for j=1:size(chain,2)
        if chain(j) == key(i)
            decoded(j) = i;
        end
    end
end

end