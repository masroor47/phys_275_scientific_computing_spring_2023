clear

headsCount = 0;

odds = [3, 1]; % fair coin

trialRepetitions = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048];
accuracy = 1000;

results = zeros(accuracy, length(trialRepetitions));

difference = zeros(accuracy, length(trialRepetitions));
variances = zeros(1, length(trialRepetitions));

odds_result = zeros(1, length(trialRepetitions));

for i = 1:length(trialRepetitions)

    tosses = trialRepetitions(i);

    for j = 1:accuracy % accuracy of variance
        headsCount = 0;
        for k = 1:tosses
            toss = myToss(1, odds);
            headsCount = headsCount + toss;
        end
        results(j, i) = (headsCount / tosses);
        % difference is currently unused
        difference(j, i) = abs(results(i) - 0.5);

    end
    forVariance = results(:, i);
    odds_result(i) = mean(forVariance);
    variances(i) = var(forVariance);
end

% disp(results)

% plot(trialRepetitions, variances, 'o');
% bar(categorical(trialRepetitions), variances);
plot(categorical(trialRepetitions), odds_result);


% lets us use a biased coin
function y = myToss(varargin)
    % default number of tosses if no arguments
    numTosses = 1; 
    if nargin == 1
        % reassign num tosses to the input if it exists
        numTosses = varargin{1};
    end

    % default probability is half-half
    breakPoint = 0.5;
    if nargin == 2
        odds = varargin{2};
        breakPoint = odds(1) / sum(odds);
    end
    
    % allocate a column vector for results
    y = zeros([numTosses, 1]);

    for i = 1:numTosses
        if rand < breakPoint
            y(i) = 1; % heads
        else
            y(i) = 0; % tails
        end
    end
end

