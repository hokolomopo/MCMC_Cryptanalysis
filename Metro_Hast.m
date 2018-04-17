%q est la fonction de probabilité conditionnelle
%ligne = la condition, colonne = l'élément sur lequel la probabilité porte
%start_state est un nombre allant de 1 à 40
%length est la taille de la chaine de markov à créer

function result = Metro_Hast (q, start_state, length)
current_state = start_state;
result = zeros(1, length);
result(1) = start_state;

D = fileread('D.txt');
load Q;
p = genp();

for i = 2:length
    y = random_number(q(current_state, :));
    tmp_alpha = q(y, current_state)/q(current_state, y);
    alpha = min([1 tmp_alpha]);
    u = rand();
    if (u < alpha)
        current_state = y;
    end
    result(i) = current_state;
end
end