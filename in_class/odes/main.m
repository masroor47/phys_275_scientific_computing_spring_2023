clear



dt = 1e-1;
T = 10;

y1 = 1;



% initialValue(@f, y1, dt, T);

t = (0:dt:T)';

y = initialValue(@f1, y1, dt, T);

yH = heunsMeth(@f1, y1, dt, T);

yT = 3*exp(t.^2/2) - t.^2-2;

% semilogy(t, y, 'o', t, yT, t, yH, 'o');


yRK3 = classic(@f1, y1, dt, T);

semilogy(t, y, 'o', t, yT, t, yRK3, 'o');


function dydt = f(t, y)

    c = 0.5;
    
    dydt = c * y * (1 - y);
end

function dydt = f1(t, y)
    dydt = t * y + t^3;
end