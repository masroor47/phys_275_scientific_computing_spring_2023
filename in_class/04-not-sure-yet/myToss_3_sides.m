
function y = myToss_3_sides(varargin)
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
        breakPoint = odds / sum(odds);
    end
    
    % allocate a column vector for results
    y = zeros([numTosses, 1]);
    disp(y);

    for i = 1:numTosses
        toss = rand;
        if toss < breakPoint(1)
            y(i) = 1; % heads
        elseif toss < 1 - breakPoint(2)
            y(i) = -1;
        else
            y(i) = 0; % tails
        end
    end
    disp(y);
end