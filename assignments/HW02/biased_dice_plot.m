clear


N = logspace(1, 7, 7);
% set biases for first and second dice
bias1 = [1, 3, 1, 1, 1, 1];
bias2 = [1, 1, 2, 1, 1, 2];

for i = 1:length(N)
    throws = N(i);

    subplot(4, 2, i);

    politically_biased_dice(throws, bias1, bias2);

    pause(0.5);
end