
format long

% bisecting cos(x) - x

tolerance = 1e-10;
disp("bisection with tolerance:");
disp(bisect01(@func01, -1, 5, tolerance));

precision = 7;
disp("bisection with precision:");
disp(bisect02(@func01, -1, 5, precision));


% fixed point iteration cos(x)
iterations = 30;
disp("fixed point iteration:");
disp(fpi(@func02, 0, iterations));

% Newton-Raphson 
% y  =  cos(x) - x
% y' = -sin(x) - 1
derivative = @(x) -sin(x) - 1;
disp("Newton-Raphson");
disp(newtonRaphson(@func01, derivative, 0, 5));


% secant method
% only works with iterations < 9s
iterations = 10;
disp("Secant");
disp(secant(@func01, -1, 5, 9));

