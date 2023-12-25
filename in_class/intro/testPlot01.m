clear

% set limits and resolution
x1 = -2 * pi;
x2 = 2 * pi;
res = 500;

% create x-axis values
x = linspace(x1, x2, res);

% y-axis values
y1 = sin(x);
y2 = cos(x);

% plot world domination ha ha ha
plot(x, y1, x, y2)

