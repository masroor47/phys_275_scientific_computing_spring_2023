
biases = [1, 10, 1, 1, 1, 1];
disp(throwbiased(10, biases)');






function throws = throwbiased(varargin)
    sides = 6;
    times = varargin{1};
    weights = varargin{2};

%     normalizing weights
    weights = weights / sum(weights);

%     make breakpoints with weights
    breakpoints = zeros([sides, 1]);
    breakpoints(1) = weights(1);

    for i = 2:length(weights)
        breakpoints(i) = breakpoints(i-1) + weights(i);
    end
    breakpoints'

    throws = rand([times, 1]);

    for i=1:length(throws)
        disp(throws(i));
        for j=1:sides
            if throws(i) < breakpoints(j)
                throws(i) = j;
                break;
            end
        end
    end
end