clear

num_steps = 100;
step_size = 1;

trials = 5;

deltaX = zeros([length(trials), 1]);
deltaY = zeros([length(trials), 1]);
deltaX2 = zeros([length(trials), 1]);
deltaY2 = zeros([length(trials), 1]);

% for plotting
x = NaN([num_steps + 1, 1]);
y = NaN([num_steps + 1, 1]);

x(1) = 0;
y(1) = 0;

p1 = plot(x, y, '-o');

for i = 1:5
    disp("loop")
    % numWalks = walkNums(i);
    currAvgX = 0;
    currAvgX2 = 0;
    currAvgY = 0;
    currAvgY2 = 0;
    % for trial = trials
        
    % make array of random nums uniformly distributed between 0 or 1 of length numWalks
    thetas = 2.*pi.*rand([num_steps, 1]);
    x_steps = step_size.*cos(thetas);
    y_steps = step_size.*sin(thetas);

    x = NaN([num_steps + 1, 1]);
    y = NaN([num_steps + 1, 1]);
    x(1) = 0;
    y(1) = 0;
    for j = 1:length(x_steps) - 1
        x(j+1) = x(j) + x_steps(j);
        y(j+1) = y(j) + y_steps(j);
        p1.XData((i - 1)*(num_steps+1) + j + 1) = x(j+1);
        p1.YData((i - 1)*(num_steps+1) + j + 1) = y(j+1);
        pause(0.08)
    end
    p1.XData((i)*(num_steps+1)) = NaN;
    p1.YData((i)*(num_steps+1)) = NaN;

    currAvgX = currAvgX + sum(x_steps);
    currAvgY = currAvgY + sum(y_steps);
    currAvgX2 = currAvgX2 + sum(x_steps)^2;
    currAvgY2 = currAvgY2 + sum(y_steps)^2;

end
