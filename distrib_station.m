function p = distrib_station
    Q = transition_matrix;
    
    while(1)
        tmp = Q;
        Q = Q^2;
        if(max(abs(Q - tmp)) < 0.0001)
            break;
    end
    
    p = Q(1, :);

end