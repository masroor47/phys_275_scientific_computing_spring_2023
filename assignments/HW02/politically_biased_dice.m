
function politically_biased_dice(accuracy, weights1, weights2)
    
    sides = 6;

    tic

%     expected = zeros([12, 1]);
% 
%     one = accuracy / 36;
%     for i=1:5
%         expected(i+1) = i * one;
%         expected(13 - i) = i * one;
%     end
%     expected(7) = one * 6;
%     disp(expected);

    

    first = throwbiased(accuracy, weights1);
%     disp(first);

    second = throwbiased(accuracy, weights2);
%     disp(second);

    counts = zeros([12, 1]);

    for i = 1:accuracy
        sum = first(i) + second(i);
        counts(sum) = counts(sum) + 1;
    end
%     disp(counts);

    sums = 2:1:12;

    b = bar(sums, counts(2:end));
%     hold on
%     b = scatter(sums, expected(2:end), "r", "filled");
%     hold off

    toc

    title(["Number of rolls: " + num2str(accuracy, "%.e"), ...
        "Runtime: " + num2str(0)]);

end



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

    throws = rand([times, 1]);

    for i=1:length(throws)
        for j=1:sides
            if throws(i) < breakpoints(j)
                throws(i) = j;
                break;
            end
        end
    end
end


