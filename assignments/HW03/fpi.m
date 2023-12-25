function x = fpi(varargin)
    f = varargin{1};
    curr_x = varargin{2};
    iters = varargin{3};



    next_x = 0;

    for i = 1:iters
        next_x = f(curr_x);

        curr_x = next_x;
    end
    x = curr_x;
end