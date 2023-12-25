clear


f = @(x) x.^2;

a = 0;
b = 1;
n = 10;

x = linspace(a, b, n + 1)';
fVals = f(x);

h = (b - a) / n;
delx = x(2:end) - x(1:end-1);

sumLeft = 0;

% tic
% for i = 1:n
%     sumLeft = sumLeft + f(x(i)) * h;
% end
% toc

% tic
sumLeft = f(x(1:end - 1))' * delx;
% toc

disp(['left: ', num2str(sum(sumLeft))]);

sumRight = f(x(2:end))' * delx;
disp(['right: ', num2str(sum(sumRight))]);



midpoints = (x(1:end - 1) + x(2:end)) / 2;

midSum = f(midpoints)' * delx;
disp(['midpoint: ', num2str(sum(midSum))]);


trapSum = 0.5 * (fVals(1:end-1) + fVals(2:end)) * h;
sum(trapSum)



clf;
hold on

plot(x, f(x));
stem(x, f(x), '-o');

% for i = 1:n
%     plot([x(i), x(i+1)], f(i));
% end

hold off
