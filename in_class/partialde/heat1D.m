clear


r = 0.5;
h = 0.05;
k = r * h^2;

x = 0:h:1;
t = 0:k:0.4;

u = zeros([numel(t), numel(x)]);

% u(1, :) = sin(x * pi); 
width = 0.4;
% u(1, :) = heaviside(x - width) - heaviside(x - 1 + width);

u(:, end) = ones(size(t));

for j = 2 : numel(t)
    % for i = 2 : numel(x) - 1
    %     u(j, i) = (1 - 2*r)*u(j-1, i) + r*u(j-1, i-1) + r*u(j-1, i+1);
    % end
    u(j, 2:end-1) = (1 - 2*r)*u(j-1, 2:end-1) + r*u(j-1, 1:end-2) + r*u(j-1, 3:end);
end

% plot(x, u(1:5:end, :))
surf(x, t, u);



