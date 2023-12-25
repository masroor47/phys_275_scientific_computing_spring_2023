% clear

% 
% dt = 0.1;
% T = 10;
% t = (0:dt:T)';
% 
% y = zeros(size(t));
% y(1) = 2;
% 
% global c;
% c = 0.5;

function yH = heunsMeth(dydt, y1, dt, T)

    t = (0:dt:T)';

    yEu = zeros(size(t));
    yH = yEu;

    yEu(1) = y1;

    for i = 1:(length(t) - 1)

        yEu(i + 1) = yEu(i) + dydt(t(i), yEu(i)) * dt;
        
        % dydtH = 
        yH(i+1) = yH(i) + ( dydt( t(i), yEu(i) ) + dydt( t(i+1), yEu(i+1) ) / 2 ) * dt;
    
    end
    
    % yTheoretical = 1 - 1./(1 + y(1)./(1 - y(1)) * exp(c * t));
    
    % plot(t, y, 'o')
end





