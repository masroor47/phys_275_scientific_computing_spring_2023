

function x = newtonRaphson(varargin)
    f = varargin{1};
    deriv = varargin{2};
    curr_x = varargin{3};
    iters = varargin{4};

    y = 0;
    yPrime = 0;

    for i = 1:iters
        y = f(curr_x);
        yPrime = deriv(curr_x);
        curr_x = curr_x - y/yPrime;
    end
    x = curr_x;
end