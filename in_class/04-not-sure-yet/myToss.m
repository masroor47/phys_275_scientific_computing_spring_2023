
function y = myToss(varargin)
    % default value if no arguments
    numTosses = 1; 
    if nargin > 0
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