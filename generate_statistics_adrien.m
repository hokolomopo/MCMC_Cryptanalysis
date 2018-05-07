function generate_statistics_adrien

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
tabFunction = [char('random_flip'), char('random_flip_4'), char('random_flip_close'), char('random_permut')];
fileID = fopen('stat3.txt', 'w');

for convergeance = tabConvergeance
    convergeance
    fprintf(fileID, 'Convergeance = %d \n', convergeance);
    for j=1:4
        if(j == 1)
            func = 'random_flip';
        elseif(j == 2)
             func = 'random_flip_4';
        elseif(j == 3)
             func = 'random_flip_close';
         elseif(j == 4)
             func = 'random_permut';
        end
        func
        fprintf(fileID, 'fonction = %s \n', func);
        nbIter = 0;
        nbConverge = 0;
        nbDecodeConv = 0;
        nbDecodeNotConv = 0;
        for i = 1:nbLoop
            i;
            [nbIterations, mar_chaine] = Metro_Hast_no_print(D_int, Q, pi_0, start_state, func, convergeance, limitConvergeance);
            result = mar_chaine(end, :);
            decoded = decode(D_int, result);
            seq = arrayfun(@(x) int_to_symbol(x), decoded);
            if(strcmp(func, 'random_flip'))
                seq
            end
            if (nbIterations < limitConvergeance)
                nbIter = nbIter + nbIterations;
                nbConverge = nbConverge + 1;
                if(strcmp(seq(1:85), correctSeq(1:85)))
                    nbDecodeConv = nbDecodeConv + 1;
                end
            else
                if(strcmp(seq(1:85), correctSeq(1:85)))
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