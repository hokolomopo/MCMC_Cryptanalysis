function generate_statistics

D = fileread('D.txt');
D_int = arrayfun(@(x) symbol_to_int(x), D(1:(end -1)));

load Q;

load correctSeq;

pi_0 = load('pinit.mat');
pi_0 = pi_0.pinit;

start_state = 1:40;

limitConvergeance = 20000;
nbLoop = 20;
tabConvergeance = [10 50 100 200 500];
tabFunction = [string('random_flip'), string('random_flip_4'), string('random_flip_close'), string('random_permut')];
fileID = fopen('stat.txt', 'w');

for convergeance = tabConvergeance
    convergeance
    fprintf(fileID, 'Convergeance = %d \n', convergeance);
    for func = tabFunction
        func
        fprintf(fileID, 'fonction = %s \n', func);
        nbIter = 0;
        nbConverge = 0;
        nbDecodeConv = 0;
        nbDecodeNotConv = 0;
        for i = 1:nbLoop
            i
            [nbIterations, mar_chaine] = Metro_Hast_no_print(D_int, Q, pi_0, start_state, func, convergeance, limitConvergeance);
            result = mar_chaine(end, :);
            decoded = decode(D_int, result);
            seq = arrayfun(@(x) int_to_symbol(x), decoded);
            
            if (nbIterations < limitConvergeance)
                nbIter = nbIter + nbIterations;
                nbConverge = nbConverge + 1;
                if(strcmp(seq(1:85), correctSeq(1:85)))
                    nbDecodeConv = nbDecodeConv + 1;
                end
            else
                if(strcmp(seq, correctSeq))
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
end
fclose(fileID);

end