
function dice(accuracy)
    sides = 6;

    tic

    expected = zeros([12, 1]);

    one = accuracy / 36;
    for i=1:5
        expected(i+1) = i * one;
        expected(13 - i) = i * one;
    end
    expected(7) = one * 6;
%     disp(expected);

    

    first = throw(accuracy);
%     disp(first);

    second = throw(accuracy);
%     disp(second);

    counts = zeros([12, 1]);

    for i = 1:accuracy
        sum = first(i) + second(i);
        counts(sum) = counts(sum) + 1;
    end
%     disp(counts);

    sums = 2:1:12;

    b = bar(sums, counts(2:end));
    hold on
    b = scatter(sums, expected(2:end), "r", "filled");
    hold off

    toc

    title(["Number of rolls: " + num2str(accuracy, "%.e"), ...
        "Runtime: " + num2str(0)]);

end



function throws = throw(varargin)
    times = varargin{1};
    sides = 6;

    %     random float from 1 to 6
    throws = rand([times, 1]) * (sides) + 1;
    %     random integer 1 to 6
    throws = floor(throws);
end


