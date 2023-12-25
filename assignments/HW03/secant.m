
function x = secant(varargin)
    f = varargin{1};
    left = varargin{2};
    right = varargin{3};
    iters = varargin{4};

    if left == right
        error("endpoints must be distinct, silly.");
    end

    
    % x values
    prev = left;
    curr = right;
    next = 0;

    for i = 1:iters
%         disp([prev, curr, next])
        fx = f(curr);
        fprev = f(prev);
        
        dx = fx - fprev;

        if abs(dx) < eps
            break;
        end

        next = curr - (fx * (curr - prev)) / (dx);

        prev = curr;
        curr = next;
    end
    x = curr;

end