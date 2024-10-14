% Sélectionner les parents par roulette


function parents = Select_roulette(pop, scores)
    proba = 1 ./ scores;
   
    proba = proba / sum(proba);
    iparents = randsample(1:length(scores), 2, true, proba);%ran sel 2 parents of the pop
    parents = pop(iparents, :);
end
