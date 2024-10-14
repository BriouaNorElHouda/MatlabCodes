% Initialize the cells
cells = zeros(1, 50);
cells(25) = 1;

% Define the Rule 30 lookup table
lookup_table = [0, 0, 0, 1, 1, 1, 1, 0];

% Apply Rule 30 for 50 iterations
for iter = 1:50
    % Display the current state of the cells
   disp(cells);
    
    % Update the cells according to Rule 30
    new_cells = zeros(1, 50);
    for i = 2:49
        new_cells(i) = lookup_table(bin2dec(sprintf('%d%d%d', cells(i-1), cells(i), cells(i+1)))+1);
    end
    
    % Update the cells for the next iteration
    cells = new_cells;
     imagesc(new_cells);
end
