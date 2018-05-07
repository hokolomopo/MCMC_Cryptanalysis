function stat_variable_length

load corruptedSeq;
intCorruptedSeq = arrayfun(@(x) symbol_to_int(x), corruptedSeq);

load Q;

load testSeq;

pi_0 = load('pinit.mat');
pi_0 = pi_0.pinit;

tabLength = [9 101 504 1373];

start_state = 1:40;

func = 'random_flip';
limitConvergeance = 20000;
convergeance = 200;
nbLoop = 20;

fileID = fopen('stat_length.txt', 'w');

for length = tabLength
    length
    fprintf(fileID, 'length = %d \n', length);
    nbIter = 0;
    nbConverge = 0;
    nbDecodeConv = 0;
    nbDecodeNotConv = 0;
    for i = 1:nbLoop
        i
        [nbIterations, mar_chaine] = Metro_Hast_no_print(intCorruptedSeq(1:length), Q, pi_0, start_state, func, convergeance, limitConvergeance);
        result = mar_chaine(end, :);
        decoded = decode(intCorruptedSeq(1:length), result);
        seq = arrayfun(@(x) int_to_symbol(x), decoded);
        
        if (nbIterations < limitConvergeance)
            nbIter = nbIter + nbIterations;
            nbConverge = nbConverge + 1;
            if(strcmp(seq, testSeq(1:length)))
                nbDecodeConv = nbDecodeConv + 1;
            end
        else
            if(strcmp(seq, testSeq(1:length)))
                nbDecodeNotConv = nbDecodeNotConv + 1;
            end
        end
    end
    
    if (nbConverge ~= 0)
        meanIter = nbIter/nbConverge;
        fprintf(fileID, 'Moyenne iterations = %d \n', meanIter);
    else
        fprintf(fileID, 'Never converge \n');
    end
    
    pourcConverge = (nbConverge/nbLoop)*100;
    fprintf(fileID, 'pourcentage de convergeance =  %d \n', pourcConverge);
    
    if (nbConverge ~= 0)
        pourcDecodeConv = (nbDecodeConv/nbConverge)*100;
        fprintf(fileID, 'pourcentage de correct avec convergeance =  %d \n', pourcDecodeConv);
    else
        fprintf(fileID, 'Never converge \n');
    end
    
    nbNotConverge = nbLoop - nbConverge;
    
    if (nbNotConverge ~= 0)
        pourcDecodeNotConv = (nbDecodeNotConv/nbNotConverge)*100;
        fprintf(fileID, 'pourcentage de correct sans convergeance =  %d \n', pourcDecodeNotConv);
    else
        fprintf(fileID, 'Always converge \n');
    end
    
    nbDecode = nbDecodeConv + nbDecodeNotConv;
    pourcDecode = (nbDecode/nbLoop)*100;
    fprintf(fileID, 'pourcentage de correct =  %d \n', pourcDecode);
end
fclose(fileID);

end