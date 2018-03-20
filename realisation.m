function real = realisation(T)

Q = transition_matrix();
statio = distrib_station();

x = random_number(statio);
real(1) = corresponding_letter(x);

for i = 2:T

    x = random_number(Q(x, :));
    real(i) = corresponding_letter(x);
    
end


end