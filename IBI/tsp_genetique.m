function tsp_genetique()

    % Nombre de villes
    nbre_villes = 8;
    % G�n�rer les coordonn�es des villes de mani�re al�atoire
    villes = randi([1, 100], nbre_villes, 2);
    
    % Param�tres de l'algorithme g�n�tique
    Popsize = 20;%nombre des individu
    Niterations = 50;%how many generations
    Pc = 0.09;
    Pm = 0.02;

    % Initialiser la population
    pop = Init_int(Popsize, nbre_villes);

    % Boucle d'optimisation g�n�tique i=generation
    for i = 1:Niterations 
        
        % �valuer la population
        scores = evaluer_pop(pop, villes);
        
        % S�lectionner les parents par roulette
        parents =  Select_roulette(pop, scores);
        
        % Appliquer le croisement d'ordre partiel (partially-mapped crossover)
        vect = Coss_int(parents, Pc);
        
        % Appliquer la mutation par inversion
        vect = Mut_int(vect, Pm);
        
        % Remplacer la population par les enfants
        pop = vect;% the loss of good solutions from the previous generation
        
        % Afficher la meilleure distance actuelle
        meilleur_score = min(scores);
        fprintf('Generation %d: Meilleure distance = %.2f\n', i, meilleur_score);
    end

    % Afficher le parcours optimal
    meilleur_individu = pop(1, :);
    meilleur_parcours = villes(meilleur_individu, :);
    
    % Ajouter la premi�re ville � la fin pour former un cycle
    meilleur_parcours = [meilleur_parcours; meilleur_parcours(1, :)];
    
    % Afficher le r�sultat
    fprintf('Parcours optimal:\n');
    disp(meilleur_parcours);
    
    % Dessiner le parcours optimal
    figure;
    plot(i (1:Niterations),meilleur_score(i, :), '-v');
    title('Parcours Optimal');
    xlabel('Coordonn�e X');
    ylabel('Coordonn�e Y');
    grid on;
end


