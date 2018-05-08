function p = distrib_station
%Compute the stationnary distribution for the question 1.1.3

    %Comute the transition matrix
    Q = transition_matrix();
    
    while(1)
        
        %Memorize the current Q and compute the next
        tmp = Q;
        Q = Q^2;
        
        %Check if the stationnary distribution is reached
        if(max(abs(Q - tmp)) < 0.0001)
            break;
        end
        
    end
    
    p = Q(1, :);
end