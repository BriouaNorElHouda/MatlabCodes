% Définition des règles
function new_state = apply_rules(state)
    new_state = zeros(1, length(state));
    for i = 1:length(state)
        if i == 1
            new_state(i) = state(i+1);
        elseif i == length(state)
            new_state(i) = state(i-1);
        else
            left = state(i-1);
            center = state(i);
            right = state(i+1);
            if left == 1 && center == 1 && right == 1
                new_state(i) = 0;
            elseif left == 1 && center == 1 && right == 0
                new_state(i) = 0;
            elseif left == 1 && center == 0 && right == 1
                new_state(i) = 0;
            elseif left == 1 && center == 0 && right == 0
                new_state(i) = 1;
            elseif left == 0 && center == 1 && right == 1
                new_state(i) = 1;
            elseif left == 0 && center == 1 && right == 0
                new_state(i) = 1;
            elseif left == 0 && center == 0 && right == 1
                new_state(i) = 1;
            elseif left == 0 && center == 0 && right == 0
                new_state(i) = 0;
            end
        end
    end
end

% Initialisation de l'état initial avec la case du milieu à l'état 1
state = zeros(1, 50);
state(26) = 1;

% Boucle principale pour itérer l'automate cellulaire
for i = 1:50
    disp(state)
    state = apply_rules(state);
end
