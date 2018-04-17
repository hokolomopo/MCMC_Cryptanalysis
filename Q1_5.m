function correlation = Q1_5

samples = 100;
load('seq.mat');
seq_size = size(seq);

correlation = zeros(1, samples);

for i = 1:samples
   
    real = realisation(seq_size(2));
    corre = corrcoef(real, seq)
    
end

end