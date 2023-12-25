% 1D normal
clear

walkNums = [1e1, 1e2, 1e3, 1e4, 1e5, 1e6];
trials = 100;

deltaX = zeros([length(trials), 1]);
deltaX2 = zeros([length(trials), 1]);

for i = 1:length(walkNums)
    numWalks = walkNums(i);
    currAvgX = 0;
    currAvgX2 = 0;
    for trial = 1 : trials
        
        % make array of random nums uniformly distributed between 0 or 1 of length numWalks
        walks = randn([numWalks, 1]);

        currAvgX = currAvgX + sum(walks);
        currAvgX2 = currAvgX2 + sum(walks)^2;
    end
    
    deltaX(i) = currAvgX / trials;
    deltaX2(i) = currAvgX2 / trials;
end

% deltaX
loglog(walkNums, abs(deltaX), '-o', walkNums, deltaX2, '-o');