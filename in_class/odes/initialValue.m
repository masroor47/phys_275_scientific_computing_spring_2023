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

function y = initialValue(dydt, y1, dt, T)

    t = (0:dt:T)';

    y = zeros(size(t));
    y(1) = y1;

    for i = 1:(length(t) - 1)

        y(i + 1) = y(i) + dydt(t(i), y(i)) * dt;
    
    end
    
    % yTheoretical = 1 - 1./(1 + y(1)./(1 - y(1)) * exp(c * t));
    
    % plot(t, y, 'o')
end





