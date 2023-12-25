clear

repeat = 250;
errors = zeros([repeat, 1]);
h_vals = logspace(-1, -15, repeat);

% function who's derivative to evaluate
f = @(x) sin(x) - cos(x);

% evaluate at x = 0
x = 0;

for i = 1: repeat
    h = h_vals(i);

    d = (f(x + h) - f(x - h)) / (2 * h);

    error = d - 1;

    errors(i) = abs(error);

end

loglog(h_vals, errors);