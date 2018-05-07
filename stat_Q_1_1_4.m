function stat_Q_1_1_4

tabLength = [1 10 50 100 200 500 1000 10000 100000];

fileID = fopen('stat_Q4.txt', 'w');

for length = tabLength
    fprintf(fileID, "length = %d \n", length);
    chain = realisation(length);
    nba = count(chain, 'a');
    fprintf(fileID, "a = %d \n", nba/length);
    nbb = count(chain, 'b');
    fprintf(fileID, "b = %d \n", nbb/length);
    nbc = count(chain, 'c');
    fprintf(fileID, "c = %d \n", nbc/length);
    nbd = count(chain, 'd');
    fprintf(fileID, "d = %d \n", nbd/length);
end

fprintf(fileID, "same several times \n");
chain = '';
length = 10000;
for i = 1:length
    chain = strcat(chain, realisation(1));
end
nba = count(chain, 'a');
fprintf(fileID, "a = %d \n", nba/length);
nbb = count(chain, 'b');
fprintf(fileID, "b = %d \n", nbb/length);
nbc = count(chain, 'c');
fprintf(fileID, "c = %d \n", nbc/length);
nbd = count(chain, 'd');
fprintf(fileID, "d = %d \n", nbd/length);
end