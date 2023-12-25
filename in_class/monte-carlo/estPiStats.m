

function [estPiAve, estPiStD] = estPiStats(numThrows, numTrials)

%   array for storing pi estimates for each trial
    pis = zeros([numTrials, 1]);

    for i = 1:numTrials
        pis(i) = estPi(numThrows);
    end

    estPiAve = sum(pis) / numTrials;

    estPiStD = std(pis);

    plot(pis, "o");

    hold on

%     red is the real value of pi
    plot([1, numTrials], pi * [1, 1], 'red');

%     blue is our average value
    plot([1, numTrials], (estPiAve) * [1, 1], 'blue');

    plot([1, numTrials], (estPiAve - estPiStD) * [1, 1], '--k');

    plot([1, numTrials], (estPiAve + estPiStD) * [1, 1], '--k');

    hold off

end