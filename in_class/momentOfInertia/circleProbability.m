clear
format long

theta = linspace(0, 2*pi);

r = 1;

x = r * cos(theta);
y = r * sin(theta);

plot(x, y);

axis square;


numPoints = 1e6;

x1 = 2 * (rand([numPoints, 1]) - 0.5);
y1 = 2 * (rand([numPoints, 1]) - 0.5);

hold on
scatter(x1, y1, '.');

hold off


trials = 100;
pis = zeros([trials, 1]);

for j = 1:trials

    pointsIn = 0;
    x1 = 2 * (rand([numPoints, 1]) - 0.5);
    y1 = 2 * (rand([numPoints, 1]) - 0.5);
    for i = 1:numPoints
        if x1(i) ^ 2 + y1(i) ^ 2 < 1
            pointsIn = pointsIn + 1;
        end
    end

    piEst = 4 * pointsIn / numPoints;
    pis(j) = piEst;
end

pointsOut = numPoints - pointsIn;

% ratio = pointsIn / numPoints
finalPi = sum(pis) / trials

diff = pi - finalPi


