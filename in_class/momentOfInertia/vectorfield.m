clear

x = -pi:pi/12:pi;
y = -pi:pi/12:pi;

[X, Y] = meshgrid(x, y);


%%

R = sqrt(X.^2 + Y.^2);

R2 = X.^2 + Y.^2;


V = (X./R2);

U = -(Y./R2);



quiver(X, Y, U, V, 0.5);