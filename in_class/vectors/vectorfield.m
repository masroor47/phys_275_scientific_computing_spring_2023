clear

x = -pi:pi/8:pi;
y = -pi:pi/8:pi;

[X, Y] = meshgrid(x, y);


%%

% U = sin(Y);
% V = cos(X);

U = zeros(size(X));
V = ones(size(Y));


%%


quiver(X, Y, U, V);