clear



x = linspace(-0.5, 0.5, 101);
y = x;
z = x;

[X1, Y1] = meshgrid(x, y);

[X2, Z2] = meshgrid(x, z);

[Y3, Z3] = meshgrid(y, z);

Z = zeros(size(X1));


s1 = surf(X1, Y1, Z);

axis(2 * [-1, 1, -1, 1, -1, 1])
axis square

dir = [0, 0, 1];

orig = [-0.5, -0.5, 0];

xline = orig(1) + dir(1) * [1, -1];
yline = orig(2) + dir(2) * [1, -1];
zline = orig(3) + dir(3) * [1, -1];

hold on

p1 = plot3(xline, yline, zline, 'k', 'LineWidth',2);

hold off


% f = (x^2 + y^2) * dmda;


dmda = 1;
da = 0.00001;
dI = (X1.^2 + Y1.^2) * dmda;
surf(X1, Y1, dI);
Isum = dI(1:end-1, 1:end-1) * da;

sum(Isum, 'all')





%%

theta = 5;
for i = 1:3600 / theta
    rotate(s1, dir, theta, orig )
%     direction(3) = dir(3) + 0.01;
    pause(0.05)

end