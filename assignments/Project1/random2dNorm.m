clear

walkNums = [1e1, 1e2, 1e3, 1e4, 1e5, 1e6]';
% walkNums = round(logspace(1,7, 7));

% num_steps = 100;
% step_size = 1;

trials = 1000;

deltaX = zeros([length(trials), 1]);
deltaY = zeros([length(trials), 1]);
deltaX2 = zeros([length(trials), 1]);
deltaY2 = zeros([length(trials), 1]);

deltaR = zeros([length(walkNums), 1]);
deltaR2 = zeros([length(walkNums), 1]);


for i = 1:length(walkNums)
    num_steps = walkNums(i);
    disp([i, num_steps])

    currAvgX = 0;
    currAvgX2 = 0;
    currAvgY = 0;
    currAvgY2 = 0;

    currAvgR = 0;
    currAvgR2 = 0;
        
    % 
    for trial = 1:trials
        step_size = randn([num_steps, 1]);
        thetas = 2.*pi.*rand([num_steps, 1]);
        x_steps = step_size.*cos(thetas);
        y_steps = step_size.*sin(thetas);

        currAvgX = currAvgX + sum(x_steps);
        currAvgY = currAvgY + sum(y_steps);

        currAvgX2 = currAvgX2 + sum(x_steps)^2;
        currAvgY2 = currAvgY2 + sum(y_steps)^2;
    end
    
    deltaR(i) = sqrt(currAvgX.^2 + currAvgY.^2) / trials;
    deltaR2(i) = (currAvgX2 + currAvgY2) / trials;

   
end



loglog(walkNums, deltaR, '-o', walkNums, deltaR2, '-o');


