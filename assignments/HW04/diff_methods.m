clear

funct = @(x) sin(x) - cos(x);
step = 0.0001
disp(deriv(funct, 0, step, 'f'));

disp(deriv(funct, 0, step, 'b'));

disp(deriv(funct, 0, step, 'c'));






function d = forward(f, x, step)
    d = (f(x + step) - f(x)) / step;
end

function d = backward(f, x, step)
    d = (f(x) - f(x - step)) / step;
end

function d = central(f, x, step)
    d = (f(x + step) - f(x - step)) / (2 * step);
end


function d = deriv(varargin)
    f = varargin{1};
    x = varargin{2};
    step = varargin{3};

    % default method is central
    method = @central;
    % if optional for selecting the method is given, then do that
    if nargin > 3
        method_str = varargin{4};
    
        switch method_str   
            case 'f'
                method = @forward;
            case 'b'
                method = @backward;
            case 'c'
                method = @central;
            otherwise
                error("Wrong method string. Choose 'f', 'b' or 'c' like literally.")
        end
    end
    % call the appropriate method
    d = method(f, x, step);
end