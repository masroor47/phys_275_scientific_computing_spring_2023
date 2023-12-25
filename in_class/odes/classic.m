



% Runge - Kutta method

function y = classic(dydt, y1, dt, T)

    t = (0:dt:T)';

    y = zeros(size(t));

    y(1) = y1;
    % yRK3 = yEu;

    for i = 1:(length(t) - 1)

        c = [1, 4, 1] / 6;
        a = [0, 1/2, 1];
        b = [0 0 0; 1/2 0 0; -1 2 0];
        K = [0 0 0];

        K(1) = dydt(t(i), y(i));
        K(2) = dydt(t(i) + a(2) * dt, y(i) + b(2,1) * K(1) * dt);
        K(3) = dydt(t(i) + a(3) * dt, y(i) + b(3,1) * K(1) * dt + b(3, 2) * K(2) * dt);
        
        y(i + 1) = y(i) + dydt(t(i), y(i)) * dt;

        % size(c)
        % size(K)
        % size(c.*K)

        y(i + 1) = y(i) + c*K'*dt;
    
    end
    
    % yTheoretical = 1 - 1./(1 + y(1)./(1 - y(1)) * exp(c * t));
    
    % plot(t, y, 'o')
end





