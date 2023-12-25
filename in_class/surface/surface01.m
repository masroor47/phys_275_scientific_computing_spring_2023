clear

%%

dx = 0.1;
dy = 0.1;

xmin = -5;
xmax = 5;

ymin = -5;
ymax = 5;

x = xmin:dx:xmax;
y = ymin:dy:ymax;

[X, Y] = meshgrid(x, y);

%%

Z = exp(-(X.^2 + Y.^2));
zfun = @(x, y) exp(-(x.^2 + y.^2));

%%

surf(X, Y, Z);

total_volume = 0;

dA = dx * dy;

tic
% lower left
for i = 1:length(x) - 1
    for j = 1:length(y) - 1
    
        dV = Z(j, i) * dA;
    
        total_volume = total_volume + dV;
    
    end
end
toc

tic
% lower left
lower_left = sum(Z(1:end-1, 1:end-1), 'all') * dA;
toc

% upper left
upper_left = sum(Z(2:end, 1:end-1), 'all') * dA;

% upper right
upper_right = sum(Z(2:end, 2:end), 'all') * dA;

% lower right
lower_right = sum(Z(1:end-1, 2:end), 'all') * dA;




disp(['mine: ', num2str(total_volume)])
disp(' ')

disp(['fast: ', num2str(lower_left)])
disp(' ')

disp(['builtin: ', num2str(integral2(zfun, xmin, xmax, ymin, ymax))]);
disp(' ')



