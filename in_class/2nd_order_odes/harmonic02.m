clear

dt = 0.01;
T = 50;
t = (0:dt:T)';

omega = 1;

drag_coef = 0.05;
mass = 1;

x = zeros(size(t));
v = x;

x(1) = 1;
v(1) = 0;

A = sqrt(x(1)^2 + (v(1) / omega)^2);
phi = atan(-v(1) / (omega * x(1)));

for i = 1:numel(t) - 1

    v(i + 1) = v(i) - omega^2 * x(i) * dt - (drag_coef/mass) * v(i) * dt; 
    x(i + 1) = x(i) + v(i +  1) * dt;

end

xTeoretical = A * cos(omega * t + phi);

% plot(t, [x]);

%  K/m, U/m, E/m
K = (1/2) * v.^2;
U = (1/2) * omega^2 * x.^2;
E = K + U;

plot(t, [x, K, U, E]);
