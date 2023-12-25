clear


x = (0:0.1:1);
y = (0:0.1:1);
[X, Y] = meshgrid(x, y);

Z = zeros(11);
Z = Z + 1;
surf(X, Y, Z);

% hold on
% Z = Z*(-1);
% surf(X, Y, Z);
% hold off

axis([-1 1 -1 1 -1 1]*1.5);

hold on 
scatter3(0, 0, 0, '.');
hold off