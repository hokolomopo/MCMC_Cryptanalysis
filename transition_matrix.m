function Q = transition_matrix
load seq.mat
A =zeros(1, 4);
Q = zeros(4, 4);
for i=1:size(seq, 2)-1
    n = 1;
    if(seq(i) == 'b')
        n = 2;
    elseif(seq(i) == 'c')
        n = 3;
    elseif(seq(i) == 'd')
        n = 4;
    end
    A(n) = A(n) +1;
    m = 1;
    if(seq(i+1) == 'b')
        m = 2;
    elseif(seq(i+1) == 'c')
        m = 3;
    elseif(seq(i+1) == 'd')
        m = 4;
    end
   Q(n,m) = Q(n,m) +1;
end

for i=1:4
   Q(i, :) =  Q(i, :)./A(i);
end
end