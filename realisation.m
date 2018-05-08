function real = realisation(T)
%Generate a chain of size T for the question 1.1.4

%Compute the transition matric and stationnary distribution
Q = transition_matrix();
statio = distrib_station();

%Generate 
x = random_number(statio);
real(1) = corresponding_letter(x);

for i = 2:T
    %Get next letter
    x = random_number(Q(x, :));
    real(i) = corresponding_letter(x);    
end

end