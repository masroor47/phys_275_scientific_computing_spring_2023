clear

dt = 0.1;
T = 50;
t = (0:dt:T)';

omega = 1;

x = zeros(size(t));
v = x;

x(1) = 1;
v(1) = 0;

for i = 1:numel(t) - 1

    
    x(i + 1) = x(i) + v(i) * dt;
    v(i + 1) = v(i) - omega^2 * x(i) * dt; 
    

end

xTeoretical = x(1) * cos(omega * t);

plot(t, [x, xTeoretical]);
