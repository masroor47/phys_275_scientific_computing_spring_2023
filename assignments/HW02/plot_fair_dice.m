clear


N = logspace(1, 7, 7);

for i = 1:length(N)
    throws = N(i);

    subplot(4, 2, i);

    dice(throws);
    

    pause(0.5);
end