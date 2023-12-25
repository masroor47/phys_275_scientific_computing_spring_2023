clear

trials = 100;

n = 200;
step_size = 0.5;

x = zeros(n);
curr = 0;

plot(0, 0);

hold on
for trial = 1:trials
    curr = 0;
    for i = 1:n
        
        if rand < 0.5
            curr = curr + step_size;
        else
            curr = curr - step_size;
        end
        x(i) = curr;
    end
    plot(x)
end
hold off
