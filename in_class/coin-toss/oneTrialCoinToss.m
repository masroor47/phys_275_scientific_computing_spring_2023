clear

totalTosses = 1e9;
repeat = 1e7;
loop = totalTosses / repeat;

numHeads = 0;

tic
for i = 1:loop

    tosses = rand([repeat, 1]);
    isHeads = tosses < 0.5;

    currHeads = sum(isHeads);

    numHeads = numHeads + currHeads;

end
numTails = totalTosses - numHeads;
toc

% numHeads = 0;
% 
% tic
% for i = 1:totalTosses
%     toss = rand();
%     isHeads = toss < 0.5;
%     
%     numHeads = numHeads + isHeads;
% 
% end
% 
% numTails = totalTosses - numHeads;
% toc

X = categorical({'Heads', 'Tails'});

bar(X, [numHeads numTails]/repeat);
title(['Number of Tosses: ', num2str(totalTosses, '%.0e')]);
